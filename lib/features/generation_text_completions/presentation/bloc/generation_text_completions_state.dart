part of 'generation_text_completions_bloc.dart';

enum GenerationTextStatus {
  initial,
  writePrompt,
  loading,
  onClean,
  success,
  failure,
}

class GenerationTextCompletionsState extends Equatable {
  final String promptText;
  final String textResponse;
  final GenerationTextStatus status;
  final String message;

  const GenerationTextCompletionsState({
    this.promptText = '',
    this.textResponse = '',
    this.status = GenerationTextStatus.initial,
    this.message = '',
  });

  GenerationTextCompletionsState copyWith({
    String? promptText,
    String? textResponse,
    GenerationTextStatus? status,
    String? message,
  }) {
    return GenerationTextCompletionsState(
      promptText: promptText ?? this.promptText,
      textResponse: textResponse ?? this.textResponse,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        promptText,
        textResponse,
        status,
        message,
      ];
}
