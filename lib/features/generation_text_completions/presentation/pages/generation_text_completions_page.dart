import 'package:ai_image_generetor/core/services/dio_service_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/data/repositories/generation_text_completions_repository_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/presentation/bloc/generation_text_completions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generation_text_completions_view.dart';

class GenerationTextCompletionsPage extends StatelessWidget {
  GenerationTextCompletionsPage({super.key});

  final GenerationTextCompletionsUseCase _generationTextCompletionsUseCase =
      GenerationTextCompletionsUseCaseImp(
          GenerationTextCompletionsRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerationTextCompletionsBloc(
          generationTextCompletionsUseCase: _generationTextCompletionsUseCase),
      child: const GenerationTextCompletionsView(),
    );
  }
}
