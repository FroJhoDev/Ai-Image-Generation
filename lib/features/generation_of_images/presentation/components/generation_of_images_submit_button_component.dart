import 'package:ai_image_generetor/core/widgets/primary_button_widget.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/bloc/generation_of_images_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationOfImagesSubmitButtonComponent extends StatelessWidget {
  const GenerationOfImagesSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      buttonText: 'Gerar Imagens',
      buttonFunction: () {
        context
            .read<GenerationOfImagesBloc>()
            .add(const GenerationImagesButtonPressedEvent());
      },
    );
  }
}
