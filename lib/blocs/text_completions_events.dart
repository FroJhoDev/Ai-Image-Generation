abstract class TextCompletionEvents {}

class CompletionsTextEvent extends TextCompletionEvents {
  String prompText;

  CompletionsTextEvent({
    required this.prompText,
  });
}


class ClearCompletionsResults extends TextCompletionEvents {}