import 'dart:convert';
import 'package:ai_image_generetor/core/service/dio_service.dart';

import 'package:ai_image_generetor/core/api_constants.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/entities/generation_of_images_entity.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/repositories/generation_of_images_repository.dart';
import 'package:ai_image_generetor/features/generation_of_images/data/models/generation_of_images_model.dart';

class GenerationOfImagesRepositoryImp implements GenerationOfImagesRepository {
  final DioService _dioService;
  GenerationOfImagesRepositoryImp(this._dioService);

  @override
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  }) async {
    var result = await _dioService
        .getDio()
        .post(ApiConstants.imagesGenerationsEndpoint, data: {
      'prompt': prompText,
      'n': int.parse(imagesAmount),
      'size': imageResoluion,
    });

    List<GenerationOfImagesEntity> listGeneratedImages =
        (result.data['data'] as List)
            .map((item) => GenerationOfImagesModel.fromJson(json.encode(item)))
            .toList();

    return listGeneratedImages;
  }
}
