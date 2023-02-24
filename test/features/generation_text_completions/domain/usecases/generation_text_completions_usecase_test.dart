import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ai_image_generetor/core/services/http_client_service_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/data/repositories/generation_text_completions_repository_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/repositories/generation_text_completions_repository.dart';

void main() {
  GenerationTextCompletionsRepository generationTextCompletionsRepository =
      GenerationTextCompletionsRepositoryImp(HttpClientServiceImp(Client()));
  
  test('Deve devolver um resultado não nulo', () async {
    var result = await GenerationTextCompletionsUseCaseImp(
            generationTextCompletionsRepository)
        .generationTextCompletion(
            prompText: 'Write a tagline for an ice cream shop.');

    expect(result, isNotNull);
  });

  test('Deve devolver uma string não vazia', () async {
    String? result = '';
    await GenerationTextCompletionsUseCaseImp(
            generationTextCompletionsRepository)
        .generationTextCompletion(
            prompText: 'Write a tagline for an ice cream shop.')
        .then((String? value) {
      result = value;
    });

    expect(result, isNotEmpty);
  });
}