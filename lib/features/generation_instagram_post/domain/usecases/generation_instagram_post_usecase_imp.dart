import 'package:ai_image_generetor/features/generation_instagram_post/domain/entities/generation_instagram_post_entity.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/repositories/generation_instagram_post_repository.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/usecases/generation_instagram_post_usecase.dart';

class GenerationInstagramPostUseCaseImp
    implements GenerationInstagramPostUseCase {
  final GenerationInstagramPostRepository _generationInstagramPostRepository;

  GenerationInstagramPostUseCaseImp(this._generationInstagramPostRepository);

  @override
  Future<GenerationInstagramPostEntity> generateInstagramPost(
      String imageDescriptionText,
      String descriptionText,
      String hashtagsText) async {
    var result = await _generationInstagramPostRepository.generateInstagramPost(
        imageDescriptionText, descriptionText, hashtagsText);
    return result;
  }
}
