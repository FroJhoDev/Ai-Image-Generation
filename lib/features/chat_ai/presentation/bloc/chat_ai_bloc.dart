import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/chat_ai_message_entity.dart';
import '../../domain/usecases/chat_ai_usecase.dart';

part 'chat_ai_event.dart';
part 'chat_ai_state.dart';

class ChatAiBloc extends Bloc<ChatAiEvent, ChatAiState> {
  final ChatAiUsecase _chatAiUsecase;

  ChatAiBloc({required chatAiUsecase})
      : _chatAiUsecase = chatAiUsecase,
        super(const ChatAiState()) {
    on<ChatAiTextMenssageChangedEvent>(_handleChatAiTextMenssageChangedEvent);
    on<ChatAiSubmitButtonPressedEvent>(_handleChatAiSubmitButtonPressedEvent);
  }

  Future<void> _handleChatAiTextMenssageChangedEvent(
      ChatAiTextMenssageChangedEvent event, Emitter<ChatAiState> emit) async {
    emit(state.copyWith(
        chatMessageSent: event.messageSent, status: ChatAiStatus.writeMessage));
  }

  Future<void> _handleChatAiSubmitButtonPressedEvent(
    ChatAiSubmitButtonPressedEvent event,
    Emitter<ChatAiState> emit,
  ) async {
    try {
      emit(state.copyWith(
          chatMessagesList: List.from(state.chatMessagesList)
            ..add(ChatAiMessageEntity(
                isReceived: false,
                message: state.chatMessageSent.trim(),
                time: '${DateTime.now().hour} : ${DateTime.now().minute}')),
          status: ChatAiStatus.sentMessage));

      emit(state.copyWith(
          chatMessagesList: List.from(state.chatMessagesList)
            ..add(
              ChatAiMessageEntity(
                isReceived: true,
                message: 'Digitando...',
                time: '${DateTime.now().hour} : ${DateTime.now().minute}',
                avatar: 'assets/images/chatgpt_logo.jpg',
              ),
            ),
          status: ChatAiStatus.waitingAnswer));

      ChatAiMessageEntity chatMessageFromAi = await _chatAiUsecase
          .sendMessageToAI(messageFromUser: state.chatMessageSent);

      emit(state.copyWith(
          chatMessagesList: state.chatMessagesList..removeLast()));

      emit(state.copyWith(
          chatMessagesList: List.from(state.chatMessagesList)
            ..add(chatMessageFromAi),
          status: ChatAiStatus.receivedMessage));
    } on Exception catch (error, stack) {
      log('Erro ao enviar mensagem para a IA', error: error, stackTrace: stack);
      emit(state.copyWith(
          message: 'Erro ao enviar mensagem para a IA',
          status: ChatAiStatus.failure));
    }
  }
}
