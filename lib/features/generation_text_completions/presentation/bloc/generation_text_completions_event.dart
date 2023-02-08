part of 'generation_text_completions_bloc.dart';

abstract class GenerationTextCompletionsEvent extends Equatable {
  const GenerationTextCompletionsEvent();

  @override
  List<Object> get props => [];
}

class GenerationTextSubmitButtonPressedEvent
    extends GenerationTextCompletionsEvent {
  const GenerationTextSubmitButtonPressedEvent();
}

class GenerationTextFieldChangedEvent extends GenerationTextCompletionsEvent {
  final String promptText;

  const GenerationTextFieldChangedEvent({required this.promptText});

  @override
  List<Object> get props => [promptText];
}

class GenerationTextClearButtonPressedEvent
    extends GenerationTextCompletionsEvent {
  const GenerationTextClearButtonPressedEvent();
}
