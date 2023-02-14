import 'dart:convert';
import 'dart:developer';

import '../../../../core/config/api_constants.dart';
import '../../../../core/entities/generation_text_completions_entity.dart';

import '../models/generation_text_completions_model.dart';
import '../../domain/repositories/generation_text_completions_repository.dart';
import '../../../../core/services/dio_service.dart';

class GenerationTextCompletionsRepositoryImp
    implements GenerationTextCompletionsRepository {
  final DioService _dioService;
  GenerationTextCompletionsRepositoryImp(this._dioService);

  @override
  Future<String?> generationTextCompletion({required String prompText}) async {
    try {
      var result = await _dioService.getDio().post(
        ApiConstants.textCompletionsEndpoint,
        data: {
          "model": "text-davinci-003",
          "prompt": prompText,
          "n": 1,
          "max_tokens": 1000,
          "temperature": 1,
        },
      );

      List<GenerationTextCompletionsEntity> generationTextsList =
          (result.data['choices'] as List)
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
