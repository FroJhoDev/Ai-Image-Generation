import '../entities/generation_of_images_entity.dart';
import '../repositories/generation_of_images_repository.dart';
import 'generation_of_images_usecase.dart';

class GenerationOfImagesUseCaseImp implements GenerationOfImagesUseCase {
  final GenerationOfImagesRepository _generationOfImagesRepository;
  GenerationOfImagesUseCaseImp(this._generationOfImagesRepository);

  @override
  Future<List<GenerationOfImagesEntity>> generationImagesFromText({
    required String prompText,
    required String imageResoluion,
    required String imagesAmount,
  }) async {
    var listOfImages =
        await _generationOfImagesRepository.generationImagesFromText(
            prompText: prompText,
            imageResoluion: imageResoluion,
            imagesAmount: imagesAmount);
    return listOfImages;
  }
}
