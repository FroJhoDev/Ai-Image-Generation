import 'package:flutter/material.dart';

import '../components/generation_text_completions_card_response.dart';
import '../components/generation_text_completions_form_component.dart';

class GenerationTextCompletionsView extends StatelessWidget {
  const GenerationTextCompletionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const [
          GenerationTextCompletionsFormComponent(),
          SizedBox(height: 15.0),
          GenerationTextCompletionsCardResponse(),
        ],
      ),
    );
  }
}
