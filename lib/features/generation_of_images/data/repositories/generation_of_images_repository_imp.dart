// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import '../../../../core/config/api_constants.dart';
import '../../../../core/services/dio_service.dart';
import '../../../../core/services/http_client_service.dart';
import '../../domain/entities/generation_of_images_entity.dart';
import '../../domain/repositories/generation_of_images_repository.dart';
import '../models/generation_of_images_model.dart';

class GenerationOfImagesRepositoryImp implements GenerationOfImagesRepository {
  final HttpClientService _httpClientService;

  GenerationOfImagesRepositoryImp(
    this._httpClientService,
  );

  @override
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  }) async {
    try {
      
      var httpResult = await _httpClientService.request(
          url: ApiConstants.imagesGenerationsEndpoint,
          method: 'post',
          body: {
            'prompt': prompText,
            'n': int.parse(imagesAmount),
            'size': imageResoluion,
          });

      List<GenerationOfImagesEntity> listGeneratedImages = (httpResult['data'] as List)
          .map((item) => GenerationOfImagesModel.fromJson(json.encode(item)))
          .toList();

      return listGeneratedImages;
    } on Exception catch (error, stack) {
      log('Erro ao recuperar imagens na API', error: error, stackTrace: stack);
      throw ('Erro ao recuperar imagens na API');
    }
  }
}
