part of 'generation_instagram_post_bloc.dart';

enum GenerationInstagramPostStatus {
  initial,
  loading,
  success,
  failure,
  onClean,
}

class GenerationInstagramPostState extends Equatable {
  final String imagePromptText;
  final String descriptionPromptText;
  final String hashtagsPromptText;
  final GenerationInstagramPostEntity? postGenerated;
  final GenerationInstagramPostStatus status;
  final String message;

  const GenerationInstagramPostState({
    this.imagePromptText = '',
    this.descriptionPromptText = '',
    this.hashtagsPromptText = '',
    this.postGenerated,
    this.status = GenerationInstagramPostStatus.initial,
    this.message = '',
  });

  GenerationInstagramPostState copyWith({
    String? imagePromptText,
    String? descriptionPromptText,
    String? hashtagsPromptText,
    GenerationInstagramPostEntity? postGenerated,
    GenerationInstagramPostStatus? status,
    String? message,
  }) {
    return GenerationInstagramPostState(
      imagePromptText: imagePromptText ?? this.imagePromptText,
      descriptionPromptText:
          descriptionPromptText ?? this.descriptionPromptText,
      hashtagsPromptText: hashtagsPromptText ?? this.hashtagsPromptText,
      postGenerated: postGenerated ?? this.postGenerated,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        imagePromptText,
        descriptionPromptText,
        hashtagsPromptText,
        postGenerated,
        status,
        message,
      ];
}
