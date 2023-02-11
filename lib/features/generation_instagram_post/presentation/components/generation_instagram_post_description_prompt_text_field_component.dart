import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_instagram_post_bloc.dart';
import '../../../../core/widgets/default_text_field_widget.dart';

class GenerationInstagramPostDescriptionPromptTextFieldComponent
    extends StatelessWidget {
  const GenerationInstagramPostDescriptionPromptTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextFieldWidget(
        hintText: 'Ex: Promoção de sanduíche de uma lanchonete em São Paulo',
        labelText: 'Descreva a legenda da postagem',
        onChangedFunction: ((value) {
          context.read<GenerationInstagramPostBloc>().add(
              GenerationInstagramDescriptionChangedEvent(
                  descriptionPromptText: value));
        }));
  }
}
