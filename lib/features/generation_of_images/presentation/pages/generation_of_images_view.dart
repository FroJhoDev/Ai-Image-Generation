import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/features/generation_of_images/presentation/bloc/generation_of_images_bloc.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/components/generation_of_images_form_component.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/components/generation_of_images_grid_view_component.dart';

class GenerationOfImagesView extends StatelessWidget {
  const GenerationOfImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerationOfImagesBloc, GenerationOfImagesState>(
      listener: (context, state) {},
      child: Column(
        children: const [
          GenerationOfImagesFormComponent(),
          SizedBox(height: 15.0),
          GenerationOfImagesGridViewComponent(),
        ],
      ),
    );
  }
}
