import 'package:ai_image_generetor/features/generation_of_images/domain/entities/generation_of_images_entity.dart';

abstract class GenerationOfImagesUseCase {
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  });
}
