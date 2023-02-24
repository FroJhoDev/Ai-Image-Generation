import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'generation_instagram_post_view.dart';

import '../../../../core/services/http_client_service_imp.dart';

import '../bloc/generation_instagram_post_bloc.dart';
import '../../data/repositories/generation_instagram_post.repository_imp.dart';
import '../../domain/usecases/generation_instagram_post_usecase.dart';
import '../../domain/usecases/generation_instagram_post_usecase_imp.dart';

import '../../../generation_of_images/data/repositories/generation_of_images_repository_imp.dart';
import '../../../generation_of_images/domain/usecases/generation_of_images_usecase_imp.dart';

import '../../../generation_text_completions/data/repositories/generation_text_completions_repository_imp.dart';
import '../../../generation_text_completions/domain/usecases/generation_text_completions_usecase_imp.dart';

class GenerationInstagramPostPage extends StatelessWidget {
  GenerationInstagramPostPage({super.key});

  final GenerationInstagramPostUseCase _generationInstagramPostUseCase =
      GenerationInstagramPostUseCaseImp(
    GenerationInstagramPostRepositoryImp(
      GenerationOfImagesUseCaseImp(
        GenerationOfImagesRepositoryImp(
          HttpClientServiceImp(
            Client(),
          ),
        ),
      ),
      GenerationTextCompletionsUseCaseImp(
        GenerationTextCompletionsRepositoryImp(
          HttpClientServiceImp(
            Client(),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerationInstagramPostBloc(
          generationInstagramPostUseCase: _generationInstagramPostUseCase),
      child: const GenerationInstagramPostView(),
    );
  }
}
