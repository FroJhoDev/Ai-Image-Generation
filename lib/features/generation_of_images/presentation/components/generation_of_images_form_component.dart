import 'package:flutter/material.dart';

import 'generation_of_images_clear_button_component.dart';
import 'generation_of_images_image_resolution_select_drop_down_component.dart';
import 'generation_of_images_images_amount_select_drop_down_component.dart';
import 'generation_of_images_prompt_text_field_component.dart';
import 'generation_of_images_submit_button_component.dart';
class GenerationOfImagesFormComponent extends StatelessWidget {
  const GenerationOfImagesFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const GenerationOfImagesPromptTextFieldComponent(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GenerationOfImagesImageResolutionSelectDropdownComponent(),
              SizedBox(width: 15.0),
              GenerationOfImagesImagesAmountSelectDropdownComponent(),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: const [
              Expanded(child: GenerationOfImagesSubmitButtonComponent()),
              SizedBox(width: 15.0),
              Expanded(child: GenerationOfImagesClearButtonComponent()),
            ],
          )
        ],
      ),
    );
  }
}
