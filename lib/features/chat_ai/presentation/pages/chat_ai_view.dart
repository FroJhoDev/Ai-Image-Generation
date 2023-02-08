import 'package:flutter/material.dart';

import '../components/chat_ai_messages_list.component.dart';
import '../components/chat_ai_text_field_component.dart';

class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ChatAiMessagesListComponent(),
        ChatAiTextFieldComponent(),
      ],
    );
  }
}
