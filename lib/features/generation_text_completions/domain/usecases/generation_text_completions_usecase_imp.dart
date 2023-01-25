// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_image_generetor/features/generation_text_completions/domain/repositories/generation_text_completions_repository.dart';
import 'package:ai_image_generetor/features/generation_text_completions/domain/usecases/generation_text_completions_usecase.dart';

class GenerationTextCompletionsUseCaseImp
    implements GenerationTextCompletionsUseCase {

  final GenerationTextCompletionsRepository _generationTextCompletionsRepository;
  GenerationTextCompletionsUseCaseImp(this._generationTextCompletionsRepository);

  @override
  Future<String?> generationTextCompletion({required String prompText}) async {
    var responseText = await _generationTextCompletionsRepository.generationTextCompletion(prompText: prompText);
    return responseText;
  }
}
