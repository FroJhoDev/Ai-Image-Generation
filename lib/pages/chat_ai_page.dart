import 'package:ai_image_generetor/blocs/chat_ai/chat_ai_bloc.dart';
import 'package:ai_image_generetor/core/color_schema.dart';
import 'package:ai_image_generetor/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:ai_image_generetor/features/chat_ai/presentation/widgets/chat_ai_item_message_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAIPage extends StatefulWidget {
  const ChatAIPage({super.key});

  @override
  State<ChatAIPage> createState() => _ChatAIPageState();
}

class _ChatAIPageState extends State<ChatAIPage> {
  final TextEditingController _messageTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatAIBloc(),
      child: BlocBuilder<ChatAIBloc, ChatAIState>(
        builder: (context, state) {
          List<ChatMessageModel> messagesList = state.chatMessagesList;
          return Stack(
            children: [
              SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 110.0),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) => ChatAiItemMessageWidget(
                      avatar: messagesList[index].avatar,
                      recieved: messagesList[index].recieved,
                      message: messagesList[index].message,
                      time: messagesList[index].time,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: TextField(
                      controller: _messageTextFieldController,
                      decoration: InputDecoration(
                        hintText: 'Digite sua mensagem...',
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        labelStyle: const TextStyle(fontSize: 12.0),
                        contentPadding: const EdgeInsets.all(20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kIconButtonColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kSecondaryColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            var date = DateTime.now();
                            var time = '${date.hour} : ${date.minute}';

                            var message = ChatMessageModel(
                              message: _messageTextFieldController.text,
                              recieved: false,
                              time: time,
                            );
                            context
                                .read<ChatAIBloc>()
                                .add(SendMessageOnChat(message: message));
                            FocusManager.instance.primaryFocus?.unfocus();
                            _messageTextFieldController.clear();
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
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
