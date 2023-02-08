import 'package:flutter/material.dart';

import 'generation_text_completions_clear_button_component.dart';
import 'generation_text_completions_prompt_text_field_component.dart';
import 'generation_text_completions_submit_button_component.dart';

class GenerationTextCompletionsFormComponent extends StatelessWidget {
  const GenerationTextCompletionsFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GenerationTextCompletionsPromptTextFieldComponent(),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(child: GenerationTextCompletionsSubmitButtonComponent()),
            SizedBox(width: 15.0),
            Expanded(child: GenerationTextCompletionsClearButtonComponent()),
          ],
        )
      ],
    );
  }
}
