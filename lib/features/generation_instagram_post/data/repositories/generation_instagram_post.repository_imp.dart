import 'dart:developer';

import 'package:ai_image_generetor/core/service/dio_service.dart';

import 'package:ai_image_generetor/features/generation_instagram_post/domain/entities/generation_instagram_post_entity.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/repositories/generation_instagram_post_repository.dart';

import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/data/repositories/generation_of_images_repository_imp.dart';

import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/data/repositories/generation_text_completions_repository_imp.dart';

class GenerationInstagramPostRepositoryImp
    implements GenerationInstagramPostRepository {
  final DioService _dioService;
  GenerationInstagramPostRepositoryImp(this._dioService);

  @override
  Future<GenerationInstagramPostEntity> generateInstagramPost(
    String imageDescriptionText,
    String descriptionText,
    String hashtagsText,
  ) async {
    try {
      final GenerationOfImagesUseCase generationOfImagesUseCase =
          GenerationOfImagesUseCaseImp(
              GenerationOfImagesRepositoryImp(_dioService));
      final GenerationTextCompletionsUseCase generationTextCompletionsUseCase =
          GenerationTextCompletionsUseCaseImp(
              GenerationTextCompletionsRepositoryImp(_dioService));

      final GenerationInstagramPostEntity instagramPost =
          GenerationInstagramPostEntity();

      late String postImage;
      late String postDescriptionText;
      late String postHashtags;

      await generationOfImagesUseCase
          .generationImagesFromText(
              prompText: '$imageDescriptionText, sem textos',
              imageResoluion: '512x512',
              imagesAmount: '1')
          .then((listOfImages) {
        postImage = listOfImages.first.imageUrl;
      });

      await generationTextCompletionsUseCase
          .generationTextCompletion(
              prompText: 'texto chamativo sobre $descriptionText')
          .then((generationTextForDescription) {
        postDescriptionText = generationTextForDescription.toString();
      });

      await generationTextCompletionsUseCase
          .generationTextCompletion(
              prompText: 'hashtags para postagem sobre $hashtagsText')
          .then((generationTextForDescription) {
        postHashtags = generationTextForDescription.toString();
      });

      instagramPost.postImage = postImage;
      instagramPost.postDescription = postDescriptionText;
      instagramPost.postHashtags = postHashtags;

      return instagramPost;
    } on Exception catch (error, stack) {
      log('Erro ao gerar postagem', error: error, stackTrace: stack);
      throw ('Erro ao gerar postagem');
    }
  }
}
