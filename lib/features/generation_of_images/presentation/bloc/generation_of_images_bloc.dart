import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/generation_of_images_entity.dart';
import '../../domain/usecases/generation_of_images_usecase.dart';

part 'generation_of_images_event.dart';
part 'generation_of_images_state.dart';

class GenerationOfImagesBloc
    extends Bloc<GenerationOfImagesEvent, GenerationOfImagesState> {
  final GenerationOfImagesUseCase _generationOfImagesUseCase;

  GenerationOfImagesBloc({required generationOfImagesUseCase})
      : _generationOfImagesUseCase = generationOfImagesUseCase,
        super(const GenerationOfImagesState()) {
    on<GenerationImagesSubmitButtonPressedEvent>(
        _handleGenerationImagesSubmitButtonPressedEvent);
    on<TextPromptChangedEvent>(_handleTextPromptChangedEvent);
    on<SelectImageResolutionChangedEvent>(
        _handleSelectImageResolutionChangedEvent);
    on<SelectImagesAmountChangedEvent>(_handleSelectImagesAmountChangedEvent);
    on<GenerationImagesClearStateButtonPressedEvent>(
        _handleGenerationImagesClearStateButtonPressedEvent);
  }

  Future<void> _handleGenerationImagesSubmitButtonPressedEvent(
    GenerationImagesSubmitButtonPressedEvent event,
    Emitter<GenerationOfImagesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: GenerationOfImagesStatus.loading));
      var listOfImages =
          await _generationOfImagesUseCase.generationImagesFromText(
        prompText: state.promptText,
        imageResoluion: state.imageResoluion,
        imagesAmount: state.imagesAmount,
      );

      emit(state.copyWith(
        listGenerationOfImagesEntity: listOfImages,
        status: GenerationOfImagesStatus.success,
      ));
    } catch (error) {
      emit(state.copyWith(
        message: error.toString(),
        status: GenerationOfImagesStatus.failure,
      ));
    }
  }

  Future<void> _handleTextPromptChangedEvent(
    TextPromptChangedEvent event,
    Emitter<GenerationOfImagesState> emit,
  ) async {
    emit(state.copyWith(promptText: event.promptText));
  }

  Future<void> _handleSelectImageResolutionChangedEvent(
    SelectImageResolutionChangedEvent event,
    Emitter<GenerationOfImagesState> emit,
  ) async {
    emit(state.copyWith(imageResoluion: event.imageResoluion));
  }

  Future<void> _handleSelectImagesAmountChangedEvent(
    SelectImagesAmountChangedEvent event,
    Emitter<GenerationOfImagesState> emit,
  ) async {
    emit(state.copyWith(imagesAmount: event.imagesAmount));
  }

  Future<void> _handleGenerationImagesClearStateButtonPressedEvent(
    GenerationImagesClearStateButtonPressedEvent event,
    Emitter<GenerationOfImagesState> emit,
  ) async {
    emit(state.copyWith(
        status: GenerationOfImagesStatus.initial,
        listGenerationOfImagesEntity: []));
  }
}
