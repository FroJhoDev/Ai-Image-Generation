import 'chat_ai_usecase.dart';
import '../entities/chat_ai_message_entity.dart';
import '../repositories/chat_ai_repository.dart';

class ChatAiUsecaseImp implements ChatAiUsecase {
  final ChatAiRepository _chatAiRepository;
  ChatAiUsecaseImp(this._chatAiRepository);

  @override
  Future<ChatAiMessageEntity> sendMessageToAI(
      {required String messageFromUser}) async {
    var mensageFromAi = await _chatAiRepository.sendMessageToAI(
        messageFromUser: messageFromUser);
    return mensageFromAi;
  }
}
