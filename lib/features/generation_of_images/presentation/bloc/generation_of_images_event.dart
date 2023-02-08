part of 'generation_of_images_bloc.dart';

abstract class GenerationOfImagesEvent extends Equatable {
  const GenerationOfImagesEvent();

  @override
  List<Object> get props => [];
}

class GenerationImagesSubmitButtonPressedEvent extends GenerationOfImagesEvent {
  const GenerationImagesSubmitButtonPressedEvent();
}

class GenerationImagesClearStateButtonPressedEvent extends GenerationOfImagesEvent {
  const GenerationImagesClearStateButtonPressedEvent();
}

class TextPromptChangedEvent extends GenerationOfImagesEvent {
  final String promptText;

  const TextPromptChangedEvent({required this.promptText});
  @override
  List<Object> get props => [promptText];
}

class SelectImageResolutionChangedEvent extends GenerationOfImagesEvent {
  final String imageResoluion;

  const SelectImageResolutionChangedEvent({required this.imageResoluion});
  @override
  List<Object> get props => [imageResoluion];
}

class SelectImagesAmountChangedEvent extends GenerationOfImagesEvent {
  final String imagesAmount;

  const SelectImagesAmountChangedEvent({required this.imagesAmount});
  @override
  List<Object> get props => [imagesAmount];
}
