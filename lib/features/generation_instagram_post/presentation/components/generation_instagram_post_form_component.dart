import 'package:flutter/material.dart';

import 'generation_instagram_post_clear_button_component.dart';
import 'generation_instagram_post_submit_button_component.dart';
import 'generation_instagram_post_image_prompt_text_field_component.dart';
import 'generation_instagram_post_description_prompt_text_field_component.dart';
import 'generation_instagram_post_hashtags_prompt_text_field_component.dart';

class GenerationInstagramPostFormComponent extends StatelessWidget {
  const GenerationInstagramPostFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const GenerationInstagramPostImagePromptTextFieldComponent(),
          const SizedBox(height: 10.0),
          const GenerationInstagramPostDescriptionPromptTextFieldComponent(),
          const SizedBox(height: 10.0),
          const GenerationInstagramPostHashtagsPromptTextFieldComponent(),
          const SizedBox(height: 10.0),
          Row(
            children: const [
              Expanded(child: GenerationInstagramPostSubmitButtonComponent()),
              SizedBox(width: 15.0),
              Expanded(child: GenerationInstagramPostClearButtonComponent()),
            ],
          )
        ],
      ),
    );
  }
}
