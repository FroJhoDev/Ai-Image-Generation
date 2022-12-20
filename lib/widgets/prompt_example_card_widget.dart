import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromptExapleCardWidget extends StatefulWidget {
  final String imageUrl;
  final String promptText;

  const PromptExapleCardWidget(
      {super.key, required this.imageUrl, required this.promptText});

  @override
  State<PromptExapleCardWidget> createState() => _PromptExapleCardWidgetState();
}

class _PromptExapleCardWidgetState extends State<PromptExapleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset(
                widget.imageUrl,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.promptText)),
                    ButtonBar(
                      alignment: MainAxisAlignment.end,
                      buttonPadding: const EdgeInsets.all(0),
                      children: <Widget>[
                        IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                                ClipboardData(text: widget.promptText));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: Colors.black87,
                              content:
                                  Text('Copiado para Área de Transferência'),
                            ));
                          },
                          icon: const Icon(Icons.copy),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
