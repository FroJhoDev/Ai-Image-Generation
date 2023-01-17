import 'package:ai_image_generetor/models/instagram_generation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/blocs/instagram_generation/instagram_generation_events.dart';
import 'package:ai_image_generetor/blocs/instagram_generation/instagram_generation_state.dart';

import 'package:ai_image_generetor/repositories/instagram_generation_repository.dart';

class InstagramGenerationBloc
    extends Bloc<InstagramGenerationEvents, InstagramGenerationState> {
  final _instagramGeneration = InstagramRepository();

  InstagramGenerationBloc() : super(InstagramGenerationsInitialState()) {
    on<GenerateInstagramPost>((event, emit) async {
      emit(InstagramGenerationsProgressState());

      List<InstagramGeneration> list =
          await _instagramGeneration.generateInstagramPost(
              event.imageText, event.descriptionText, event.hashtagsText);

      emit(InstagramGenerationsSuccessState(instagramGeneration: list));
    });

    on<ClearInstagramPostsResults>((event, emit) async {
      emit(InstagramGenerationsProgressState());
      emit(InstagramGenerationsSuccessState(instagramGeneration: []));
    });
  }
}
