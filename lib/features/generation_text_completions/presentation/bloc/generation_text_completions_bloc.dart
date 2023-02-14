import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/generation_text_completions_usecase.dart';

part 'generation_text_completions_event.dart';
part 'generation_text_completions_state.dart';

class GenerationTextCompletionsBloc extends Bloc<GenerationTextCompletionsEvent,
    GenerationTextCompletionsState> {
  final GenerationTextCompletionsUseCase _generationTextCompletionsUseCase;

  GenerationTextCompletionsBloc({required generationTextCompletionsUseCase})
      : _generationTextCompletionsUseCase = generationTextCompletionsUseCase,
        super(const GenerationTextCompletionsState()) {
    on<GenerationTextFieldChangedEvent>(_handleGenerationTextFieldChangedEvent);
    on<GenerationTextSubmitButtonPressedEvent>(
        _handleGenerationTextSubmitButtonPressedEvent);
    on<GenerationTextClearButtonPressedEvent>(
        _handleGenerationTextClearButtonPressedEvent);
  }

  Future<void> _handleGenerationTextFieldChangedEvent(
    GenerationTextFieldChangedEvent event,
    Emitter<GenerationTextCompletionsState> emit,
  ) async {
    emit(
      state.copyWith(
          promptText: event.promptText,
          status: GenerationTextStatus.writePrompt),
    );
  }

  Future<void> _handleGenerationTextSubmitButtonPressedEvent(
    GenerationTextSubmitButtonPressedEvent event,
    Emitter<GenerationTextCompletionsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: GenerationTextStatus.loading));

      String? responseText = await _generationTextCompletionsUseCase
          .generationTextCompletion(prompText: state.promptText);

      emit(state.copyWith(
          textResponse: responseText, status: GenerationTextStatus.success));
    } on Exception catch (error, stack) {
      log('Erro ao resgatar reposta da API', error: error, stackTrace: stack);
      emit(state.copyWith(
          message: error.toString(), status: GenerationTextStatus.failure));
    }
  }

  Future<void> _handleGenerationTextClearButtonPressedEvent(
    GenerationTextClearButtonPressedEvent event,
    Emitter<GenerationTextCompletionsState> emit,
  ) async {
    emit(
        state.copyWith(textResponse: '', status: GenerationTextStatus.onClean));
  }
}
