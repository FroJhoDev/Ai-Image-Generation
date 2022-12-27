import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/models/text_completions_model.dart';
import 'package:ai_image_generetor/blocs/text_completions_events.dart';
import 'package:ai_image_generetor/blocs/text_completions_state.dart';
import 'package:ai_image_generetor/repositories/text_completions_repository.dart';

class TextCompletionsBloc
    extends Bloc<TextCompletionEvents, TextCompletionState> {
  final _textCompletionsRepo = TextCompletionsRepository();

  TextCompletionsBloc() : super(TextCompletionInitialState()) {
    on<CompletionsTextEvent>((event, emit) async {
      emit(TextCompletionInProgressState());

      List<Choices> list =
          await _textCompletionsRepo.createsCompletion(event.prompText);

      emit(TextCompletionSuccessState(textCompletions: list));
    });

    on<ClearCompletionsResults>((event, emit) async {
     emit(TextCompletionInProgressState());
     emit(TextCompletionSuccessState(textCompletions: []));
    });
  }
}
