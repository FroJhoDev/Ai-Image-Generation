import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/core/widgets/default_text_field_widget.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/bloc/generation_of_images_bloc.dart';

class GenerationOfImagesPromptTextFieldComponent extends StatelessWidget {
  const GenerationOfImagesPromptTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextFieldWidget(
      labelText: 'Descreva a imagem à ser gerada',
      hintText: 'Ex: a white siamese cat',
      onChangedFunction: ((value) {
        context
            .read<GenerationOfImagesBloc>()
            .add(TextPromptChangedEvent(promptText: value));
      }),
    );
  }
}
