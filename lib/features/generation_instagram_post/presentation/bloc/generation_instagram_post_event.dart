part of 'generation_instagram_post_bloc.dart';

abstract class GenerationInstagramPostEvent extends Equatable {
  const GenerationInstagramPostEvent();

  @override
  List<Object> get props => [];
}

class GenerationInstagramSubmitButtonPressedEvent
    extends GenerationInstagramPostEvent {
  const GenerationInstagramSubmitButtonPressedEvent();
}

class GenerationInstagramClearButtonPressedEvent
    extends GenerationInstagramPostEvent {
  const GenerationInstagramClearButtonPressedEvent();
}

class GenerationInstagramImageChangedEvent
    extends GenerationInstagramPostEvent {
  final String imagePromptText;
  const GenerationInstagramImageChangedEvent({
    required this.imagePromptText,
  });

  @override
  List<Object> get props => [imagePromptText];
}

class GenerationInstagramDescriptionChangedEvent
    extends GenerationInstagramPostEvent {
  final String descriptionPromptText;
  const GenerationInstagramDescriptionChangedEvent({
    required this.descriptionPromptText,
  });
  @override
  List<Object> get props => [descriptionPromptText];
}

class GenerationInstagramHashtagsChangedEvent
    extends GenerationInstagramPostEvent {
  final String hashtagsPromptText;
  const GenerationInstagramHashtagsChangedEvent({
    required this.hashtagsPromptText,
  });
  @override
  List<Object> get props => [hashtagsPromptText];
}
