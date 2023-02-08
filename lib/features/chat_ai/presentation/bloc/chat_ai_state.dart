part of 'chat_ai_bloc.dart';

enum ChatAiStatus {
  initial,
  writeMessage,
  sentMessage,
  waitingAnswer,
  receivedMessage,
  failure,
}

class ChatAiState extends Equatable {
  final String message;
  final String chatMessageSent;
  final ChatAiStatus status;
  final List<ChatAiMessageEntity> chatMessagesList;

  const ChatAiState({
    this.message = '',
    this.chatMessageSent = '',
    this.status = ChatAiStatus.initial,
    this.chatMessagesList = const <ChatAiMessageEntity>[],
  });

  ChatAiState copyWith({
    String? message,
    String? chatMessageSent,
    ChatAiStatus? status,
    List<ChatAiMessageEntity>? chatMessagesList,
  }) {
    return ChatAiState(
      message: message ?? this.message,
      chatMessageSent: chatMessageSent ?? this.chatMessageSent,
      status: status ?? this.status,
      chatMessagesList: chatMessagesList ?? this.chatMessagesList,
    );
  }

  @override
  List<Object?> get props => [
        message,
        chatMessageSent,
        status,
        chatMessagesList,
      ];
}
