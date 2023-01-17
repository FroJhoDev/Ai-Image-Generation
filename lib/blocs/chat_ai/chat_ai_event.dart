part of 'chat_ai_bloc.dart';

abstract class ChatAIEvent extends Equatable {
  const ChatAIEvent();

  @override
  List<ChatMessageModel> get props => [];
}

class SendMessageOnChat extends ChatAIEvent {
  final ChatMessageModel message;
  const SendMessageOnChat({
    required this.message,
  });
}
