part of 'generation_of_images_bloc.dart';

enum GenerationOfImagesStatus {
  initial,
  loading,
  success,
  failure,
}

class GenerationOfImagesState extends Equatable {
  final String promptText;
  final String imageResoluion;
  final String imagesAmount;
  final String message;
  final GenerationOfImagesStatus status;
  final List<GenerationOfImagesEntity>? listGenerationOfImagesEntity;

  const GenerationOfImagesState({
    this.promptText = '',
    this.imageResoluion = '256x256',
    this.imagesAmount = '4',
    this.message = '',
    this.status = GenerationOfImagesStatus.initial,
    this.listGenerationOfImagesEntity,
  });

  GenerationOfImagesState copyWith({
    String? promptText,
    String? imageResoluion,
    String? imagesAmount,
    String? message,
    GenerationOfImagesStatus? status,
    List<GenerationOfImagesEntity>? listGenerationOfImagesEntity,
  }) {
    return GenerationOfImagesState(
      promptText: promptText ?? this.promptText,
      imageResoluion: imageResoluion ?? this.imageResoluion,
      imagesAmount: imagesAmount ?? this.imagesAmount,
      message: message ?? this.message,
      status: status ?? this.status,
      listGenerationOfImagesEntity:
          listGenerationOfImagesEntity ?? this.listGenerationOfImagesEntity,
    );
  }

  @override
  List<Object?> get props => [
        promptText,
        imageResoluion,
        imagesAmount,
        message,
        status,
        listGenerationOfImagesEntity,
      ];
}
