import '../entities/generation_of_images_entity.dart';

abstract class GenerationOfImagesUseCase {
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  });
}
