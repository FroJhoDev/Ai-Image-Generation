import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_instagram_post_bloc.dart';
import '../../../../core/widgets/default_text_field_widget.dart';

class GenerationInstagramPostHashtagsPromptTextFieldComponent
    extends StatelessWidget {
  const GenerationInstagramPostHashtagsPromptTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextFieldWidget(
        labelText: 'Hashtags para postagem',
        hintText: 'Ex: Lanchonete em São Paulo, promoção, sanduíche artesanal',
        onChangedFunction: ((value) {
          context.read<GenerationInstagramPostBloc>().add(
              GenerationInstagramHashtagsChangedEvent(
                  hashtagsPromptText: value));
        }));
  }
}
