import 'package:ai_image_generetor/models/text_completions_model.dart';

abstract class TextCompletionState {
  List<Choices> textCompletions;

  TextCompletionState({required this.textCompletions});
}

class TextCompletionInitialState extends TextCompletionState {
  TextCompletionInitialState() : super(textCompletions: []);
}

class TextCompletionInProgressState extends TextCompletionState {
  TextCompletionInProgressState() : super(textCompletions: []);
}

class TextCompletionSuccessState extends TextCompletionState {
  TextCompletionSuccessState({required List<Choices> textCompletions})
      : super(textCompletions: textCompletions);
}
