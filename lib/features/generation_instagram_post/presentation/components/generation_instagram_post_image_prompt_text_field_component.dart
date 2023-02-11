import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_instagram_post_bloc.dart';
import '../../../../core/widgets/default_text_field_widget.dart';

class GenerationInstagramPostImagePromptTextFieldComponent
    extends StatelessWidget {
  const GenerationInstagramPostImagePromptTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextFieldWidget(
        labelText: 'Descreva a imagem da postagem',
        hintText:
            'Ex: Uma sanduíche com carne e alface em uma mesa, fundo preto',
        onChangedFunction: ((value) {
          context.read<GenerationInstagramPostBloc>().add(
              GenerationInstagramImageChangedEvent(imagePromptText: value));
        }));
  }
}
