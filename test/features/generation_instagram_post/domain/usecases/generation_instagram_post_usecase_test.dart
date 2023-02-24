import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import 'package:ai_image_generetor/core/services/http_client_service_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/data/repositories/generation_of_images_repository_imp.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase_imp.dart';

import 'package:ai_image_generetor/features/generation_text_completions/data/repositories/generation_text_completions_repository_imp.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase_imp.dart';

import 'package:ai_image_generetor/features/generation_instagram_post/data/models/generation_instagram_post_model.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/data/repositories/generation_instagram_post.repository_imp.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/entities/generation_instagram_post_entity.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/usecases/generation_instagram_post_usecase.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/domain/usecases/generation_instagram_post_usecase_imp.dart';

void main() {
  GenerationInstagramPostUseCase generationInstagramPostUseCase =
      GenerationInstagramPostUseCaseImp(
    GenerationInstagramPostRepositoryImp(
      GenerationOfImagesUseCaseImp(
        GenerationOfImagesRepositoryImp(
          HttpClientServiceImp(
            Client(),
          ),
        ),
      ),
      GenerationTextCompletionsUseCaseImp(
        GenerationTextCompletionsRepositoryImp(
          HttpClientServiceImp(
            Client(),
          ),
        ),
      ),
    ),
  );

  Future<GenerationInstagramPostEntity> mockResquestForInstagramPost =
      generationInstagramPostUseCase.generateInstagramPost(
          'a white siamese cat', 'a white siamese cat', 'a white siamese cat');

  test('Deve devolver um resultado não nulo', () async {
    var result = await mockResquestForInstagramPost;

    expect(result, isNotNull);
  });

  test('Deve retorna uma Descrição de post não vazia', () async {
    GenerationInstagramPostEntity result = GenerationInstagramPostModel(
        imageUrl: '', description: '', hashtags: '');
    await mockResquestForInstagramPost.then((instagramPost) {
      result = instagramPost;
    });

    expect(result.postDescription, isNotEmpty);
  });

  test('Deve retorna uma Hashtags de post não vazia', () async {
    GenerationInstagramPostEntity result = GenerationInstagramPostModel(
        imageUrl: '', description: '', hashtags: '');
    await mockResquestForInstagramPost.then((instagramPost) {
      result = instagramPost;
    });

    expect(result.postHashtags, isNotEmpty);
  });

  test('Deve retorna a URL de uma Imagem', () async {
    GenerationInstagramPostEntity result = GenerationInstagramPostModel(
        imageUrl: '', description: '', hashtags: '');
    await mockResquestForInstagramPost.then((instagramPost) {
      result = instagramPost;
    });

    expect(result.postImage, isNotEmpty);
  });
}
