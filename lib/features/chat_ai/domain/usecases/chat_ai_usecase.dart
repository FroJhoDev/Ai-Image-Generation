import '../entities/chat_ai_message_entity.dart';

abstract class ChatAiUsecase {
  Future<ChatAiMessageEntity> sendMessageToAI({required String messageFromUser});
}
