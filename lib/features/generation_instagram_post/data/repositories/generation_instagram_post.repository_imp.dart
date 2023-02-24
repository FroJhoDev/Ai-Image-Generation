import 'dart:developer';

import '../models/generation_instagram_post_model.dart';
import '../../domain/entities/generation_instagram_post_entity.dart';
import '../../domain/repositories/generation_instagram_post_repository.dart';

import '../../../generation_of_images/domain/usecases/generation_of_images_usecase.dart';
import '../../../generation_text_completions/domain/usecases/generation_text_completions_usecase.dart';

class GenerationInstagramPostRepositoryImp
    implements GenerationInstagramPostRepository {
  final GenerationOfImagesUseCase _generationOfImagesUseCase;
  final GenerationTextCompletionsUseCase _generationTextCompletionsUseCase;

  GenerationInstagramPostRepositoryImp(
      this._generationOfImagesUseCase, this._generationTextCompletionsUseCase);

  @override
  Future<GenerationInstagramPostEntity> generateInstagramPost(
    String imageDescriptionText,
    String descriptionText,
    String hashtagsText,
  ) async {
    try {
      late String postImage;
      late String postDescription;
      late String postHashtags;

      await _generationOfImagesUseCase
          .generationImagesFromText(
              prompText: '$imageDescriptionText, sem textos',
              imageResoluion: '512x512',
              imagesAmount: '1')
          .then(
        (listOfImages) {
          postImage = listOfImages.first.imageUrl;
        },
      );

      await _generationTextCompletionsUseCase
          .generationTextCompletion(
              prompText: 'texto chamativo sobre $descriptionText')
          .then(
        (generationTextForDescription) {
          postDescription = generationTextForDescription.toString();
        },
      );

      await _generationTextCompletionsUseCase
          .generationTextCompletion(
              prompText: 'hashtags para postagem sobre $hashtagsText')
          .then(
        (generationTextForDescription) {
          postHashtags = generationTextForDescription.toString();
        },
      );

      return GenerationInstagramPostModel(
        imageUrl: postImage,
        description: postDescription,
        hashtags: postHashtags,
      );
    } on Exception catch (error, stack) {
      log('Erro ao gerar postagem', error: error, stackTrace: stack);
      throw ('Erro ao gerar postagem');
    }
  }
}
