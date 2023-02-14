import 'dart:developer';

import '../../../../core/services/dio_service.dart';

import '../../domain/entities/generation_instagram_post_entity.dart';
import '../../domain/repositories/generation_instagram_post_repository.dart';

import '../../../generation_of_images/data/repositories/generation_of_images_repository_imp.dart';
import '../../../generation_of_images/domain/usecases/generation_of_images_usecase.dart';
import '../../../generation_of_images/domain/usecases/generation_of_images_usecase_imp.dart';

import '../../../generation_text_completions/data/repositories/generation_text_completions_repository_imp.dart';
import '../../../generation_text_completions/domain/usecases/generation_text_completions_usecase.dart';
import '../../../generation_text_completions/domain/usecases/generation_text_completions_usecase_imp.dart';
import '../models/generation_instagram_post_model.dart';

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

      late String postImage;
      late String postDescription;
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
        postDescription = generationTextForDescription.toString();
      });

      await generationTextCompletionsUseCase
          .generationTextCompletion(
              prompText: 'hashtags para postagem sobre $hashtagsText')
          .then((generationTextForDescription) {
        postHashtags = generationTextForDescription.toString();
      });

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
