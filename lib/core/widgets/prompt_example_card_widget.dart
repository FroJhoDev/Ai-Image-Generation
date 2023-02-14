import 'package:flutter/material.dart';

import '../helpers/copy_to_clipboard_helper.dart';
import '../styles/color_schema.dart';

class PromptExapleCardWidget extends StatelessWidget {
  final String imageUrl;
  final String promptText;

  const PromptExapleCardWidget(
      {super.key, required this.imageUrl, required this.promptText});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(child: Text(promptText)),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    buttonPadding: const EdgeInsets.all(0),
                    children: <Widget>[
                      IconButton(
                        onPressed: () async =>
                            copyToClipboardHelper(promptText, context),
                        icon: const Icon(
                          Icons.copy,
                          color: kIconButtonColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
