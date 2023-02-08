import 'package:ai_image_generetor/core/widgets/secondary_button_widget.dart';
import 'package:ai_image_generetor/features/generation_text_completions/presentation/bloc/generation_text_completions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationTextCompletionsClearButtonComponent extends StatelessWidget {
  const GenerationTextCompletionsClearButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButtonWidget(
        buttonText: 'Limpar',
        buttonFunction: () => context
            .read<GenerationTextCompletionsBloc>()
            .add(const GenerationTextClearButtonPressedEvent()));
  }
}
