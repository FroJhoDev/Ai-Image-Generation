import 'package:ai_image_generetor/core/color_schema.dart';
import 'package:ai_image_generetor/usecases/clipboard_function.dart';
import 'package:flutter/material.dart';

class ItemChatWidget extends StatelessWidget {
  final String avatar;
  final bool recieved;
  final String message;
  final String time;

  const ItemChatWidget(
      {super.key,
      this.avatar = '',
      required this.recieved,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async => recieved ? copyToClipboard(message, context) : {},
      child: Row(
        mainAxisAlignment:
            recieved ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          recieved
              ? CircleAvatar(backgroundImage: AssetImage(avatar))
              : Text(
                  time,
                  style: TextStyle(color: Colors.grey.shade400),
                ),
          Flexible(
              child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: recieved
                    ? kPrimaryColor.withOpacity(0.5)
                    : kSecondaryColor.withOpacity(0.5),
                borderRadius: recieved
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      )),
            child: Text(message),
          )),
          recieved
              ? Text(
                  time,
                  style: TextStyle(color: Colors.grey.shade400),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
