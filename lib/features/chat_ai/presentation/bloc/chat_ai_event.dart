part of 'chat_ai_bloc.dart';

abstract class ChatAiEvent extends Equatable {
  const ChatAiEvent();

  @override
  List<Object> get props => [];
}

class ChatAiSubmitButtonPressedEvent extends ChatAiEvent {
  const ChatAiSubmitButtonPressedEvent();
}

class ChatAiTextMenssageChangedEvent extends ChatAiEvent {
  final String messageSent;

  const ChatAiTextMenssageChangedEvent({required this.messageSent});

  @override
  List<Object> get props => [messageSent];
}
