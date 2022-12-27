import 'package:ai_image_generetor/blocs/text_completions_events.dart';
import 'package:ai_image_generetor/blocs/text_completions_state.dart';
import 'package:ai_image_generetor/functions/clipboard_function.dart';
import 'package:flutter/material.dart';

import 'package:ai_image_generetor/blocs/text_completions_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextCompletionsPage extends StatefulWidget {
  const TextCompletionsPage({super.key});

  @override
  State<TextCompletionsPage> createState() => _TextCompletionsPageState();
}

class _TextCompletionsPageState extends State<TextCompletionsPage> {
  late final TextCompletionsBloc bloc;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = TextCompletionsBloc();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Descreva um texto para ser gerado ou completado',
              hintText: 'Ex: How to make a delicious hot chocolate?',
              prefixIcon: InkWell(
                  onTap: () => {_textEditingController.clear()},
                  child: const Icon(Icons.close)),
            ),
            controller: _textEditingController,
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_textEditingController.value.toString().isNotEmpty) {
                      bloc.add(
                        CompletionsTextEvent(
                          prompText: _textEditingController.value.toString(),
                        ),
                      );
                    }
                  },
                  child: const Text('Gerar Textos'),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    bloc.add(ClearCompletionsResults());
                    _textEditingController.clear();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 3.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  child: const Text('Resetar'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          BlocBuilder<TextCompletionsBloc, TextCompletionState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is TextCompletionInProgressState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is TextCompletionSuccessState) {
                final completionsTextList = state.textCompletions;

                return Expanded(
                  child: ListView.builder(
                      itemCount: completionsTextList.length,
                      itemBuilder: (context, index) => Card(
                            elevation: 5,
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          completionsTextList[index]
                                              .text
                                              .toString(),
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonBar(
                                      alignment: MainAxisAlignment.end,
                                      buttonPadding: const EdgeInsets.all(0),
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () async =>
                                              copyToClipboard(
                                                  completionsTextList[index]
                                                      .text
                                                      .toString(),
                                                  context),
                                          icon: const Icon(Icons.copy),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                );
              }
              return const Expanded(
                child: Center(
                  child: Text('Adicione um prompt e toque em Gerar Textos'),
                ),
              );
            },
          ),
          // Card(
          //   elevation: 5,
          //   color: Colors.grey[100],
          //   child: SizedBox(
          //       width: MediaQuery.of(context).size.width,
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(15.0),
          //             child: Row(
          //               children: const [
          //                 Expanded(
          //                   child: Text(
          //                     '" ' +
          //                         'Try giving more clues. In some cases to better help the models generation' +
          //                         ' "',
          //                     style: TextStyle(fontSize: 16.0),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               ButtonBar(
          //                 alignment: MainAxisAlignment.end,
          //                 buttonPadding: const EdgeInsets.all(0),
          //                 children: <Widget>[
          //                   IconButton(
          //                     onPressed: () async {},
          //                     icon: const Icon(Icons.copy),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           )
          //         ],
          //       )),
          // ),
        ],
      ),
    );
  }
}
