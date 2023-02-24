import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'generation_of_images_view.dart';
import '../bloc/generation_of_images_bloc.dart';
import '../../data/repositories/generation_of_images_repository_imp.dart';
import '../../domain/usecases/generation_of_images_usecase.dart';
import '../../domain/usecases/generation_of_images_usecase_imp.dart';
import '../../../../core/services/http_client_service_imp.dart';

class GenerationOfImagesPage extends StatelessWidget {
  GenerationOfImagesPage({super.key});

  final GenerationOfImagesUseCase _generationOfImagesUseCase =
      GenerationOfImagesUseCaseImp(
          GenerationOfImagesRepositoryImp(HttpClientServiceImp(Client())));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenerationOfImagesBloc(
            generationOfImagesUseCase: _generationOfImagesUseCase),
        child: const GenerationOfImagesView());
  }
}
