import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_text_completions_bloc.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class GenerationTextCompletionsSubmitButtonComponent extends StatelessWidget {
  const GenerationTextCompletionsSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFormValid = false;

    return BlocListener<GenerationTextCompletionsBloc,
        GenerationTextCompletionsState>(
      listener: (context, state) {
        isFormValid = state.promptText.isNotEmpty ? true : false;
      },
      child: PrimaryButtonWidget(
        buttonText: 'Gerar Textos',
        buttonFunction: () {
          if (isFormValid) {
            context
                .read<GenerationTextCompletionsBloc>()
                .add(const GenerationTextSubmitButtonPressedEvent());
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
