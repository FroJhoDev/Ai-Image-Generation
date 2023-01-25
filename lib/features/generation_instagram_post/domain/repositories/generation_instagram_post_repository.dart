import 'package:ai_image_generetor/features/generation_instagram_post/domain/entities/generation_instagram_post_entity.dart';

abstract class GenerationInstagramPostRepository {
  Future<GenerationInstagramPostEntity> generateInstagramPost(
      String imageDescriptionText, String descriptionText, String hashtagsText);
}
