import 'package:ai_image_generetor/usecases/clipboard_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:ai_image_generetor/blocs/instagram_generation/instagram_generation_bloc.dart';
import 'package:ai_image_generetor/blocs/instagram_generation/instagram_generation_events.dart';
import 'package:ai_image_generetor/blocs/instagram_generation/instagram_generation_state.dart';

import 'package:ai_image_generetor/widgets/primary_button_widget.dart';
import 'package:ai_image_generetor/widgets/secondary_button_widget.dart';
import 'package:ai_image_generetor/widgets/custom_circular_progress_widget.dart';
import 'package:ai_image_generetor/widgets/default_text_field_widget.dart';
import 'package:ai_image_generetor/usecases/download_image_function.dart';
import 'package:ai_image_generetor/constants.example.dart';

class InstagramPostPage extends StatefulWidget {
  const InstagramPostPage({super.key});

  @override
  State<InstagramPostPage> createState() => _InstagramPostPageState();
}

class _InstagramPostPageState extends State<InstagramPostPage> {
  late final InstagramGenerationBloc bloc;

  final TextEditingController _descriptionEditingController =
      TextEditingController();
  final TextEditingController _imageEditingController = TextEditingController();
  final TextEditingController _hashtagsEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = InstagramGenerationBloc();
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
            labelText: 'Descreva a imagem da postagem',
            hintText:
                'Ex: Uma sanduíche com carne e alface em uma mesa, fundo preto',
            textEditingController: _imageEditingController,
          ),
          const SizedBox(height: 15.0),
          DefaultTextFieldWidget(
            labelText: 'Descreva a legenda da postagem',
            hintText:
                'Ex: Promoção de sanduíche de uma lanchonete em São Paulo',
            textEditingController: _descriptionEditingController,
          ),
          const SizedBox(height: 15.0),
          DefaultTextFieldWidget(
            labelText: 'Hashtags para postagem',
            hintText:
                'Ex: Lanchonete em São Paulo, promoção, sanduíche artesanal',
            textEditingController: _hashtagsEditingController,
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                child: PrimaryButtonWidget(
                  buttonText: 'Gerar Post',
                  buttonFunction: () {
                    if (_imageEditingController.text.isNotEmpty &&
                        _descriptionEditingController.text.isNotEmpty &&
                        _hashtagsEditingController.text.isNotEmpty) {
                      bloc.add(GenerateInstagramPost(
                          imageText: _imageEditingController.text,
                          descriptionText: _descriptionEditingController.text,
                          hashtagsText: _hashtagsEditingController.text));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Campos em Branco"),
                              content: const Text(
                                  "Você deve preencher todos os campos para continuar."),
                              actions: [
                                PrimaryButtonWidget(
                                  buttonText: 'Ok',
                                  buttonFunction: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: SecondaryButtonWidget(
                  buttonText: 'Resetar',
                  buttonFunction: () {
                    bloc.add(ClearInstagramPostsResults());
                    _imageEditingController.clear();
                    _descriptionEditingController.clear();
                    _hashtagsEditingController.clear();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          BlocBuilder<InstagramGenerationBloc, InstagramGenerationState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is InstagramGenerationsProgressState) {
                  return const CustomCircularProgressWidget();
                } else if (state is InstagramGenerationsSuccessState) {
                  final instagramPostsList = state.instagramGeneration;

                  return Expanded(
                      child: ListView.builder(
                    itemCount: instagramPostsList.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 5.0,
                      color: Colors.grey[100],
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(MdiIcons.dotsVertical,
                                    size: 25, color: Colors.grey),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Image.network(
                                instagramPostsList[index].imageUrl.toString(),
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                  top: 5,
                                  right: 5,
                                  child: IconButton(
                                      onPressed: () => downloadImg(
                                          instagramPostsList[index]
                                              .imageUrl
                                              .toString(),
                                          context),
                                      icon: const Icon(
                                        MdiIcons.download,
                                        color: kSecondaryColor,
                                        size: 40,
                                      ))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(MdiIcons.heartOutline,
                                    size: 25, color: Colors.grey),
                                const SizedBox(width: 5),
                                const Icon(MdiIcons.chatOutline,
                                    size: 25, color: Colors.grey),
                                const SizedBox(width: 5),
                                const Icon(MdiIcons.sendOutline,
                                    size: 25, color: Colors.grey),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Icon(MdiIcons.bookmarkOutline,
                                          size: 25, color: Colors.grey),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5.0, top: 5.0, left: 10.0, right: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(instagramPostsList[index]
                                        .description
                                        .toString())),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(instagramPostsList[index]
                                        .hashtags
                                        .toString())),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SecondaryButtonWidget(
                                buttonText: 'Copiar Legenda e Hashtags',
                                buttonFunction: () => copyToClipboard(
                                    instagramPostsList[index]
                                            .description
                                            .toString() +
                                        instagramPostsList[index]
                                            .hashtags
                                            .toString(),
                                    context)),
                          ),
                        ],
                      ),
                    ),
                  ));
                }
                return const Expanded(
                  child: Center(
                    child: Text('Preencha os campos e toque em Gerar o Post'),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
