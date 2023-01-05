import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/blocs/image_generations_bloc.dart';
import 'package:ai_image_generetor/blocs/image_generations_events.dart';
import 'package:ai_image_generetor/blocs/image_generations_state.dart';
import 'package:ai_image_generetor/widgets/image_dialog_widget.dart';
import 'package:ai_image_generetor/widgets/primary_button_widget.dart';
import 'package:ai_image_generetor/widgets/secondary_button_widget.dart';
import 'package:ai_image_generetor/widgets/custom_circular_progress_widget.dart';
import 'package:ai_image_generetor/widgets/default_text_field_widget.dart';
import 'package:ai_image_generetor/services/check_connectivity_function.dart';
import 'package:ai_image_generetor/services/download_image_function.dart';
import 'package:ai_image_generetor/services/local_storage_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ImageGenerationsBloc bloc;
  final TextEditingController _textEditingController = TextEditingController();

  String _imageSize = '512x512';
  String _imageNumber = '4';

  @override
  void initState() {
    super.initState();
    bloc = ImageGenerationsBloc();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          DefaultTextFieldWidget(
            labelText: 'Descreva a imagem à ser gerada',
            hintText: 'Ex: a white siamese cat',
            textEditingController: _textEditingController,
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: _imageSize,
                items: imgSizeDropdown,
                onChanged: (Object? value) {
                  setState(() {
                    _imageSize = value.toString();
                  });
                },
              ),
              const SizedBox(
                width: 15.0,
              ),
              DropdownButton(
                value: _imageNumber,
                items: imgNumberDropdown,
                onChanged: (Object? value) {
                  setState(() {
                    _imageNumber = value.toString();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                  child: PrimaryButtonWidget(
                buttonText: 'Gerar Imagens',
                buttonFunction: () {
                  if (_textEditingController.text.isNotEmpty) {
                    checkInternetConnectivity().then((isTrue) {
                      if (isTrue) {
                        bloc.add(
                          GenerateImagesEvent(
                            prompText: _textEditingController.value.toString(),
                            imgSize: _imageSize,
                            imgNumber: _imageNumber,
                          ),
                        );
                        saveOnLocalStorage(_textEditingController.text);
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Alerta de Conectividade"),
                                content: const Text(
                                    "Você esta utilizando os dados móveis, a geração de imagens demanda uma grande quantidade de banda. Cogite se conectar a uma rede wifi e tente novamente."),
                                actions: [
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.blueGrey,
                                    ),
                                    child: const Text("Cancelar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                    ),
                                    child: const Text("Continuar"),
                                    onPressed: () {
                                      bloc.add(
                                        GenerateImagesEvent(
                                          prompText: _textEditingController
                                              .value
                                              .toString(),
                                          imgSize: _imageSize,
                                          imgNumber: _imageNumber,
                                        ),
                                      );
                                      saveOnLocalStorage(
                                          _textEditingController.text);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    });
                  }
                },
              )),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: SecondaryButtonWidget(
                  buttonText: 'Limpar',
                  buttonFunction: () {
                    bloc.add(ClearResults());
                    _textEditingController.clear();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          BlocBuilder<ImageGenerationsBloc, ImageGenerationsState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ImageGenerationsInProgressState) {
                return const CustomCircularProgressWidget();
              } else if (state is ImageGenerationsSuccessState) {
                final imgGeneratedList = state.imageGenerations;

                return Expanded(
                  child: GridView.count(
                    primary: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.0,
                    children: List.generate(imgGeneratedList.length, (index) {
                      return Card(
                        elevation: 8.0,
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (_) => ImageDialogWidget(
                                      imgUrl: imgGeneratedList[index]
                                          .url
                                          .toString(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    imgGeneratedList[index].url.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.end,
                              buttonPadding: const EdgeInsets.all(0),
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    downloadImg(
                                        imgGeneratedList[index].url.toString(),
                                        context);
                                  },
                                  icon: const Icon(Icons.download),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
              return const Expanded(
                child: Center(
                  child: Text('Adicione um prompt e toque em gerar'),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get imgSizeDropdown {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "256x256", child: Text("256x256")),
      DropdownMenuItem(value: "512x512", child: Text("512x512")),
      DropdownMenuItem(value: "1024x1024", child: Text("1024x1024")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get imgNumberDropdown {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "4", child: Text("4")),
      DropdownMenuItem(value: "6", child: Text("6")),
      DropdownMenuItem(value: "8", child: Text("8")),
      DropdownMenuItem(value: "10", child: Text("10")),
    ];
    return menuItems;
  }
}
