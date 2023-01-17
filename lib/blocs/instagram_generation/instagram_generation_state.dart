import 'package:ai_image_generetor/models/instagram_generation_model.dart';

abstract class InstagramGenerationState {
  List<InstagramGeneration> instagramGeneration;

  InstagramGenerationState({required this.instagramGeneration});
}

class InstagramGenerationsInitialState extends InstagramGenerationState {
  InstagramGenerationsInitialState() : super(instagramGeneration: []);
}

class InstagramGenerationsProgressState extends InstagramGenerationState {
  InstagramGenerationsProgressState() : super(instagramGeneration: []);
}

class InstagramGenerationsSuccessState extends InstagramGenerationState {
  InstagramGenerationsSuccessState(
      {required List<InstagramGeneration> instagramGeneration})
      : super(instagramGeneration: instagramGeneration);
}
