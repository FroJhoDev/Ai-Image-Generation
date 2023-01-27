import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/core/widgets/custom_circular_progress_widget.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/bloc/generation_of_images_bloc.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/components/generation_of_images_card_image_component.dart';

class GenerationOfImagesGridViewComponent extends StatelessWidget {
  const GenerationOfImagesGridViewComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerationOfImagesBloc, GenerationOfImagesState>(
      builder: (context, state) {
        if (state.status == GenerationOfImagesStatus.loading) {
          return const CustomCircularProgressWidget();
        } else if (state.status == GenerationOfImagesStatus.success) {
          final imgGeneratedList = state.listGenerationOfImagesEntity ?? [];

          return Expanded(
            child: GridView.count(
              primary: true,
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              children: List.generate(imgGeneratedList.length, (index) {
                return GenerationOfImagesCardImageComponent(
                    imageUrl: imgGeneratedList[index].imageUrl);
              }),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: Text('Adicione um prompt e toque em gerar'),
            ),
          );
        }
      },
    );
  }
}
