import 'package:ai_image_generetor/features/generation_of_images/domain/entities/generation_of_images_entity.dart';
import 'package:ai_image_generetor/features/generation_of_images/domain/usecases/generation_of_images_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generation_of_images_event.dart';
part 'generation_of_images_state.dart';

class GenerationOfImagesBloc
    extends Bloc<GenerationOfImagesEvent, GenerationOfImagesState> {
  final GenerationOfImagesUseCase _generationOfImagesUseCase;

  GenerationOfImagesBloc({required generationOfImagesUseCase})
      : _generationOfImagesUseCase = generationOfImagesUseCase,
        super(const GenerationOfImagesState()) {
    on<GenerationImagesButtonPressedEvent>(
        _handleGenerationImagesButtonPressedEvent);
    on<TextPromptChangedEvent>(_handleTextPromptChangedEvent);
    on<SelectImageResolutionChangedEvent>(
        _handleSelectImageResolutionChangedEvent);
    on<SelectImagesAmountChangedEvent>(_handleSelectImagesAmountChangedEvent);
  }

  Future<void> _handleGenerationImagesButtonPressedEvent(
    GenerationImagesButtonPressedEvent event,
    Emitter<GenerationOfImagesState> emit,
  ) async {
    emit(state.copyWith(status: GenerationOfImagesStatus.loading));
    try {
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
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
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
}
