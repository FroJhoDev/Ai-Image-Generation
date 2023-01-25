import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generation_instagram_post_event.dart';
part 'generation_instagram_post_state.dart';

class GenerationInstagramPostBloc extends Bloc<GenerationInstagramPostEvent, GenerationInstagramPostState> {
  GenerationInstagramPostBloc() : super(GenerationInstagramPostInitial()) {
    on<GenerationInstagramPostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
