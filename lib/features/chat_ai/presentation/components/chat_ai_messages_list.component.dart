import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_ai_bloc.dart';
import '../widgets/chat_ai_item_message_widget.dart';
import '../../domain/entities/chat_ai_message_entity.dart';

class ChatAiMessagesListComponent extends StatelessWidget {
  const ChatAiMessagesListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatAiBloc, ChatAiState>(
      builder: (context, state) {
        List<ChatAiMessageEntity> messagesList = state.chatMessagesList;
        return SingleChildScrollView(
          reverse: true,
          child: Container(
            padding:
                const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 110.0),
            width: double.infinity,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: messagesList.length,
              itemBuilder: (context, index) => ChatAiItemMessageWidget(
                recieved: messagesList[index].isReceived,
                message: messagesList[index].message,
                time: messagesList[index].time,
                avatar: messagesList[index].avatar,
              ),
            ),
          ),
        );
      },
    );
  }
}
