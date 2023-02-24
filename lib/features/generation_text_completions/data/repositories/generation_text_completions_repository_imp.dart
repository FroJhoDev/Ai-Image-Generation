import 'dart:convert';
import 'dart:developer';


import '../../../../core/services/http_client_service.dart';
import '../../../../core/config/api_constants.dart';
import '../../../../core/entities/generation_text_completions_entity.dart';

import '../models/generation_text_completions_model.dart';
import '../../domain/repositories/generation_text_completions_repository.dart';

class GenerationTextCompletionsRepositoryImp
    implements GenerationTextCompletionsRepository {
  final HttpClientService _httpClientService;

  GenerationTextCompletionsRepositoryImp(this._httpClientService);

  @override
  Future<String?> generationTextCompletion({required String prompText}) async {
    try {
      var httpResult = await _httpClientService.request(
        url: ApiConstants.textCompletionsEndpoint,
        method: 'post',
        body: {
          "model": "text-davinci-003",
          "prompt": prompText,
          "n": 1,
          "max_tokens": 1000,
          "temperature": 1,
        },
      );

      List<GenerationTextCompletionsEntity> generationTextsList =
          (httpResult['choices'] as List)
              .map((item) =>
                  GenerationTextCompletionsModel.fromJson(json.encode(item)))
              .toList();

      return generationTextsList.first.responseText.trim();
    } on Exception catch (error, stack) {
      log('Error ao recuperar texto gerado na API',
          error: error, stackTrace: stack);
      throw ('Error ao recuperar texto gerado na API');
    }
  }
}
