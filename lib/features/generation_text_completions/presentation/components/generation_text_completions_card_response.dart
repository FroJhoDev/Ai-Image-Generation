import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_text_completions_bloc.dart';
import '../../../../core/styles/color_schema.dart';
import '../../../../core/helpers/copy_to_clipboard_helper.dart';
import '../../../../core/widgets/custom_circular_progress_widget.dart';

class GenerationTextCompletionsCardResponse extends StatelessWidget {
  const GenerationTextCompletionsCardResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerationTextCompletionsBloc,
        GenerationTextCompletionsState>(
      builder: (context, state) {
        if (state.status == GenerationTextStatus.loading) {
          return const CustomCircularProgressWidget();
        } else if (state.status == GenerationTextStatus.success) {
          return Expanded(
            child: SingleChildScrollView(
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.textResponse,
                              style: const TextStyle(fontSize: 16.0),
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
                                  copyToClipboardHelper(state.textResponse, context),
                              icon: const Icon(Icons.copy, color: kIconButtonColor),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: Text('Adicione um prompt e toque em Gerar Textos'),
            ),
          );
        }
      },
    );
  }
}
