import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_text_completions_bloc.dart';
import '../../../../core/widgets/default_text_field_widget.dart';

class GenerationTextCompletionsPromptTextFieldComponent
    extends StatelessWidget {
  const GenerationTextCompletionsPromptTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextFieldWidget(
      labelText: 'Descreva um texto para ser gerado ou completado',
      hintText: 'Ex: How to make a delicious hot chocolate?',
      onChangedFunction: ((value) {
        context
            .read<GenerationTextCompletionsBloc>()
            .add(GenerationTextFieldChangedEvent(promptText: value));
      }),
    );
  }
}
