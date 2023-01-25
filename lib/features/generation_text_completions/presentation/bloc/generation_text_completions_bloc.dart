import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generation_text_completions_event.dart';
part 'generation_text_completions_state.dart';

class GenerationTextCompletionsBloc extends Bloc<GenerationTextCompletionsEvent, GenerationTextCompletionsState> {
  GenerationTextCompletionsBloc() : super(GenerationTextCompletionsInitial()) {
    on<GenerationTextCompletionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
