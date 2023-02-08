import 'package:ai_image_generetor/core/widgets/primary_button_widget.dart';
import 'package:ai_image_generetor/features/generation_text_completions/presentation/bloc/generation_text_completions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationTextCompletionsSubmitButtonComponent extends StatelessWidget {
  const GenerationTextCompletionsSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      buttonText: 'Gerar Textos',
      buttonFunction: () {
        context
            .read<GenerationTextCompletionsBloc>()
            .add(const GenerationTextSubmitButtonPressedEvent());
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
