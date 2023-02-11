import 'dart:convert';
import 'dart:developer';

import '../models/generation_of_images_model.dart';
import '../../domain/entities/generation_of_images_entity.dart';
import '../../domain/repositories/generation_of_images_repository.dart';
import '../../../../core/config/api_constants.dart';
import '../../../../core/service/dio_service.dart';

class GenerationOfImagesRepositoryImp implements GenerationOfImagesRepository {
  final DioService _dioService;
  GenerationOfImagesRepositoryImp(this._dioService);

  @override
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  }) async {
    try {
      var responseFromApi = await _dioService
          .getDio()
          .post(ApiConstants.imagesGenerationsEndpoint, data: {
        'prompt': prompText,
        'n': int.parse(imagesAmount),
        'size': imageResoluion,
      });

      List<GenerationOfImagesEntity> listGeneratedImages = (responseFromApi
              .data['data'] as List)
          .map((item) => GenerationOfImagesModel.fromJson(json.encode(item)))
          .toList();

      return listGeneratedImages;
    } on Exception catch (error, stack) {
      log('Erro ao recuperar imagens na API', error: error, stackTrace: stack);
      throw ('Erro ao recuperar imagens na API');
    }
  }
}
