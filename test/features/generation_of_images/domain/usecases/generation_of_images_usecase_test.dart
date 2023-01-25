import 'package:flutter_test/flutter_test.dart';
import 'package:ai_image_generetor/core/service/dio_service_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/data/repositories/generation_of_images_repository_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/repositories/generation_of_images_repository.dart';

void main() {
  GenerationOfImagesRepository generationOfImagesRepository =
      GenerationOfImagesRepositoryImp(DioServiceImp());

  test('Deve devolver uma lista não vazia',
      () async {
    var result = await GenerationOfImagesUseCaseImp(generationOfImagesRepository)
        .generationImagesFromText(
            prompText: 'a white siamese cat',
            imageResoluion: '256x256',
            imagesAmount: '4');

    expect(result, isNotEmpty);
  });

  test('Deve devolver uma lista não nula',
      () async {
    var result = await GenerationOfImagesUseCaseImp(generationOfImagesRepository)
        .generationImagesFromText(
            prompText: 'a white siamese cat',
            imageResoluion: '256x256',
            imagesAmount: '4');

    expect(result, isNotNull);
  });

  test('Deve devolver uma lista com quatro (4) resultados',
      () async {
    var result = await GenerationOfImagesUseCaseImp(generationOfImagesRepository)
        .generationImagesFromText(
            prompText: 'a white siamese cat',
            imageResoluion: '256x256',
            imagesAmount: '4');

    expect(result.length, 4);
  });
}
