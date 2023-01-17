import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ai_image_generetor/repositories/text_completions_repository.dart';
import 'package:ai_image_generetor/models/chat_message_model.dart';

part 'chat_ai_event.dart';
part 'chat_ai_state.dart';

class ChatAIBloc extends Bloc<ChatAIEvent, ChatAIState> {
  final _textCompletionsRepo = TextCompletionsRepository();

  ChatAIBloc() : super(const ChatAIState()) {
    on<SendMessageOnChat>(_sendMenssageOnChat);
  }

  FutureOr<void> _sendMenssageOnChat(
      SendMessageOnChat event, Emitter<ChatAIState> emit) async {

    emit(state.copyWith(
        chatMessagesList: List.from(state.chatMessagesList)
          ..add(event.message)));

    String? messageFromAI = await _textCompletionsRepo
        .responseMenssageFromAI(event.message.message);
    
    var date = DateTime.now();
    var time = '${date.hour} : ${date.minute}';

    emit(state.copyWith(
        chatMessagesList: List.from(state.chatMessagesList)
          ..add(ChatMessageModel(
              message: messageFromAI.toString().trim(),
              recieved: true,
              time: time,
              avatar: 'assets/images/chatgpt_logo.jpg'))));
  }
}
