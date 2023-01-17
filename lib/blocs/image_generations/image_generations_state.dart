import 'package:ai_image_generetor/models/image_generations_model.dart';

abstract class ImageGenerationsState {
  List<ImageGenerationsModel> imageGenerations;

  ImageGenerationsState({
    required this.imageGenerations,
  });
}

class ImageGenerationsInitialState extends ImageGenerationsState {
  ImageGenerationsInitialState() : super(imageGenerations: []);
}

class ImageGenerationsInProgressState extends ImageGenerationsState {
  ImageGenerationsInProgressState() : super(imageGenerations: []);
}

class ImageGenerationsSuccessState extends ImageGenerationsState {
  ImageGenerationsSuccessState(
      {required List<ImageGenerationsModel> imageGenerations})
      : super(imageGenerations: imageGenerations);
}
