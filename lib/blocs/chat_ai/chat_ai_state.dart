part of 'chat_ai_bloc.dart';

class ChatAIState extends Equatable {
  final List<ChatMessageModel> chatMessagesList;

  const ChatAIState({this.chatMessagesList = const <ChatMessageModel>[]});

  ChatAIState copyWith({
    List<ChatMessageModel>? chatMessagesList,
  }) {
    return ChatAIState(
        chatMessagesList: chatMessagesList ?? this.chatMessagesList);
  }

  @override
  List<Object> get props => [
        chatMessagesList,
      ];
}
