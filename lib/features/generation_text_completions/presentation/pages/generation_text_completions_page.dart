import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'generation_text_completions_view.dart';
import '../bloc/generation_text_completions_bloc.dart';
import '../../data/repositories/generation_text_completions_repository_imp.dart';
import '../../domain/usecases/generation_text_completions_usecase.dart';
import '../../domain/usecases/generation_text_completions_usecase_imp.dart';
import '../../../../core/services/http_client_service_imp.dart';

class GenerationTextCompletionsPage extends StatelessWidget {
  GenerationTextCompletionsPage({super.key});

  final GenerationTextCompletionsUseCase _generationTextCompletionsUseCase =
      GenerationTextCompletionsUseCaseImp(
    GenerationTextCompletionsRepositoryImp(
      HttpClientServiceImp(
        Client(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerationTextCompletionsBloc(
          generationTextCompletionsUseCase: _generationTextCompletionsUseCase),
      child: const GenerationTextCompletionsView(),
    );
  }
}
