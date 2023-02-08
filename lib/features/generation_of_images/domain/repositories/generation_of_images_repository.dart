import '../entities/generation_of_images_entity.dart';

abstract class GenerationOfImagesRepository {
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  });
}
