import 'dart:convert';

import 'package:ai_image_generetor/core/api_constants.dart';
import 'package:ai_image_generetor/core/service/dio_service.dart';
import 'package:ai_image_generetor/features/generation_text_completions/data/models/generation_text_completions_model.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/entities/generation_text_completions_entity.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/repositories/generation_text_completions_repository.dart';

class GenerationTextCompletionsRepositoryImp
    implements GenerationTextCompletionsRepository {
  final DioService _dioService;
  GenerationTextCompletionsRepositoryImp(this._dioService);

  @override
  Future<String?> generationTextCompletion({required String prompText}) async {
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
            .map((item) => GenerationTextCompletionsModel.fromJson(json.encode(item)))
            .toList();

    return generationTextsList.first.responseText;
  }
}
