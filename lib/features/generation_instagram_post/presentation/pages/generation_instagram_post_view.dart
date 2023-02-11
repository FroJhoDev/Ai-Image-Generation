import 'package:flutter/material.dart';

import '../components/generation_instagram_post_card_result_component.dart';
import '../components/generation_instagram_post_form_component.dart';

class GenerationInstagramPostView extends StatelessWidget {
  const GenerationInstagramPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        GenerationInstagramPostFormComponent(),
        SizedBox(height: 15.0),
        GenerationInstagramPostCardResultComponent(),
      ],
    );
  }
}
