import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_ai_bloc.dart';
import '../../../../core/styles/color_schema.dart';

class ChatAiTextFieldComponent extends StatelessWidget {
  ChatAiTextFieldComponent({super.key});

  final TextEditingController _messageTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120.0,
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: TextField(
            controller: _messageTextFieldController,
            decoration: InputDecoration(
              hintText: 'Digite sua mensagem...',
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              labelStyle: const TextStyle(fontSize: 12.0),
              contentPadding: const EdgeInsets.all(20.0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: kIconButtonColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(25.0),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  if (_messageTextFieldController.text.isNotEmpty) {
                    context
                        .read<ChatAiBloc>()
                        .add(const ChatAiSubmitButtonPressedEvent());
                    FocusManager.instance.primaryFocus?.unfocus();
                    _messageTextFieldController.clear();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: kIconButtonColor,
                  ),
                  child: const Icon(
                    Icons.send,
                    size: 28.0,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            onChanged: ((value) {
              context
                  .read<ChatAiBloc>()
                  .add(ChatAiTextMenssageChangedEvent(messageSent: value));
            }),
          ),
        ),
      ),
    );
  }
}
