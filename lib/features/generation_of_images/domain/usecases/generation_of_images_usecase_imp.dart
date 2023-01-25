import 'package:ai_image_generetor/features/generation_of_images/domain/entities/generation_of_images_entity.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/repositories/generation_of_images_repository.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase.dart';

class GenerationOfImagesUseCaseImp implements GenerationOfImagesUseCase {
  final GenerationOfImagesRepository _generationOfImagesRepository;
  GenerationOfImagesUseCaseImp(this._generationOfImagesRepository);

  @override
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  }) async {
    var listOfImages = await _generationOfImagesRepository.generationImagesFromText(prompText: prompText, imageResoluion: imageResoluion, imagesAmount: imagesAmount);
    return listOfImages;
  }
}
