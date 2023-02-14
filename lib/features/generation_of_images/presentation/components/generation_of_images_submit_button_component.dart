import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_of_images_bloc.dart';
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
            context
                .read<GenerationOfImagesBloc>()
                .add(const GenerationImagesSubmitButtonPressedEvent());
            FocusManager.instance.primaryFocus?.unfocus();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Você deve preencher todos os campos'),
              ),
            );
          }
        },
      ),
    );
  }
}
