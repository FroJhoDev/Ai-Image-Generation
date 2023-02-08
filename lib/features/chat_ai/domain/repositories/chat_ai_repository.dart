import '../entities/chat_ai_message_entity.dart';

abstract class ChatAiRepository {
  Future<ChatAiMessageEntity> sendMessageToAI({required String messageFromUser});
}
