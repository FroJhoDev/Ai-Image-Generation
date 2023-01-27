import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/core/service/dio_service_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/data/repositories/generation_of_images_repository_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/bloc/generation_of_images_bloc.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/pages/generation_of_images_view.dart';

class GenerationOfImagesPage extends StatelessWidget {
  GenerationOfImagesPage({super.key});

  final GenerationOfImagesUseCase _generationOfImagesUseCase =
      GenerationOfImagesUseCaseImp(
          GenerationOfImagesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenerationOfImagesBloc(
            generationOfImagesUseCase: _generationOfImagesUseCase),
        child: const GenerationOfImagesView());
  }
}
