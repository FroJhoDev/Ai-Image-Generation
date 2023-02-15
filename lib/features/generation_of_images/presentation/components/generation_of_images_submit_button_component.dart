import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_of_images_bloc.dart';
import '../../../../core/styles/color_schema.dart';
import '../../../../core/usecases/check_connectivity_function.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class GenerationOfImagesSubmitButtonComponent extends StatelessWidget {
  const GenerationOfImagesSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFormValid = false;

    return BlocListener<GenerationOfImagesBloc, GenerationOfImagesState>(
      listener: (context, state) {
        if (state.promptText.isNotEmpty &&
            state.imageResoluion.isNotEmpty &&
            state.imagesAmount.isNotEmpty) {
          isFormValid = true;
        } else {
          isFormValid = false;
        }
      },
      child: PrimaryButtonWidget(
        buttonText: 'Gerar Imagens',
        buttonFunction: () {
          if (isFormValid) {
            checkInternetConnectivity().then((isConnectedOnWifi) {
              if (isConnectedOnWifi) {
                context
                    .read<GenerationOfImagesBloc>()
                    .add(const GenerationImagesSubmitButtonPressedEvent());
              } else {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text("Alerta de Conectividade"),
                        content: const Text(
                            "Você esta utilizando os dados móveis, a geração de imagens demanda uma grande quantidade de banda. Cogite se conectar a uma rede wifi e tente novamente."),
                        actions: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: kSecondaryColor,
                            ),
                            child: const Text("Cancelar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Continuar"),
                            onPressed: () {
                              context.read<GenerationOfImagesBloc>().add(
                                  const GenerationImagesSubmitButtonPressedEvent());
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Você deve preencher todos os campos'),
              ),
            );
          }
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
