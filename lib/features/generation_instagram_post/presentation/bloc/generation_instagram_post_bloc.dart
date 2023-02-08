import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/generation_instagram_post_usecase.dart';
import '../../domain/entities/generation_instagram_post_entity.dart';

part 'generation_instagram_post_event.dart';
part 'generation_instagram_post_state.dart';

class GenerationInstagramPostBloc
    extends Bloc<GenerationInstagramPostEvent, GenerationInstagramPostState> {
  final GenerationInstagramPostUseCase _generationInstagramPostUseCase;

  GenerationInstagramPostBloc({required generationInstagramPostUseCase})
      : _generationInstagramPostUseCase = generationInstagramPostUseCase,
        super(const GenerationInstagramPostState()) {
    on<GenerationInstagramImageChangedEvent>(
        _handleGenerationInstagramImageChangedEvent);
    on<GenerationInstagramDescriptionChangedEvent>(
        _handleGenerationInstagramDescriptionChangedEvent);
    on<GenerationInstagramHashtagsChangedEvent>(
        _handleGenerationInstagramHashtagsChangedEvent);
    on<GenerationInstagramSubmitButtonPressedEvent>(
        _handleGenerationInstagramSubmitButtonPressedEvent);
    on<GenerationInstagramClearButtonPressedEvent>(
        _handleGenerationInstagramClearButtonPressedEvent);
  }

  Future<void> _handleGenerationInstagramSubmitButtonPressedEvent(
    GenerationInstagramSubmitButtonPressedEvent event,
    Emitter<GenerationInstagramPostState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: GenerationInstagramPostStatus.loading,
      ));

      var instagramPostGenerated =
          await _generationInstagramPostUseCase.generateInstagramPost(
        state.imagePromptText,
        state.descriptionPromptText,
        state.hashtagsPromptText,
      );

      emit(state.copyWith(
        postGenerated: instagramPostGenerated,
        status: GenerationInstagramPostStatus.success,
      ));
    } catch (error, stack) {
      log('Erro ao gerar itens da postagem do instagram',
          error: error, stackTrace: stack);
      emit(state.copyWith(
          message: error.toString(),
          status: GenerationInstagramPostStatus.failure));
    }
  }

  Future<void> _handleGenerationInstagramImageChangedEvent(
    GenerationInstagramImageChangedEvent event,
    Emitter<GenerationInstagramPostState> emit,
  ) async {
    emit(state.copyWith(
      imagePromptText: event.imagePromptText,
    ));
  }

  Future<void> _handleGenerationInstagramDescriptionChangedEvent(
    GenerationInstagramDescriptionChangedEvent event,
    Emitter<GenerationInstagramPostState> emit,
  ) async {
    emit(state.copyWith(
      descriptionPromptText: event.descriptionPromptText,
    ));
  }

  Future<void> _handleGenerationInstagramHashtagsChangedEvent(
    GenerationInstagramHashtagsChangedEvent event,
    Emitter<GenerationInstagramPostState> emit,
  ) async {
    emit(state.copyWith(
      hashtagsPromptText: event.hashtagsPromptText,
    ));
  }

  Future<void> _handleGenerationInstagramClearButtonPressedEvent(
    GenerationInstagramClearButtonPressedEvent event,
    Emitter<GenerationInstagramPostState> emit,
  ) async {
    emit(state.copyWith(
      postGenerated: null,
      status: GenerationInstagramPostStatus.onClean,
    ));
  }
}
