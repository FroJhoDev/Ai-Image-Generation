import 'package:flutter/material.dart';

import '../components/generation_of_images_form_component.dart';
import '../components/generation_of_images_grid_view_component.dart';

class GenerationOfImagesView extends StatelessWidget {
  const GenerationOfImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        GenerationOfImagesFormComponent(),
        SizedBox(height: 15.0),
        GenerationOfImagesGridViewComponent(),
      ],
    );
  }
}
