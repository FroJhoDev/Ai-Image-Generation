import 'package:ai_image_generetor/core/services/dio_service_imp.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/data/repositories/generation_instagram_post.repository_imp.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/usecases/generation_instagram_post_usecase.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/usecases/generation_instagram_post_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/presentation/bloc/generation_instagram_post_bloc.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/presentation/pages/generation_instagram_post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationInstagramPostPage extends StatelessWidget {
  GenerationInstagramPostPage({super.key});

  final GenerationInstagramPostUseCase _generationInstagramPostUseCase =
      GenerationInstagramPostUseCaseImp(
          GenerationInstagramPostRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerationInstagramPostBloc(
          generationInstagramPostUseCase: _generationInstagramPostUseCase),
      child: const GenerationInstagramPostView(),
    );
  }
}
