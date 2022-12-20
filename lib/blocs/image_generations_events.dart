abstract class ImageGenerationsEvent {}

class GenerateImagesEvent extends ImageGenerationsEvent {
  String prompText;
  String imgSize;
  String imgNumber;

  GenerateImagesEvent({
    required this.prompText,
    required this.imgSize,
    required this.imgNumber,
  });
}

class ClearResults extends ImageGenerationsEvent {}
