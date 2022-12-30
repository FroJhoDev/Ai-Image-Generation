import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_image_generetor/blocs/image_generations_events.dart';
import 'package:ai_image_generetor/blocs/image_generations_state.dart';
import 'package:ai_image_generetor/models/image_generations_model.dart';
import 'package:ai_image_generetor/repositories/image_generations_repository.dart';

class ImageGenerationsBloc
    extends Bloc<ImageGenerationsEvent, ImageGenerationsState> {
  final _imageGenerationsRepo = ImageGenerationsRepository();

  ImageGenerationsBloc() : super(ImageGenerationsInitialState()) {
    on<GenerateImagesEvent>((event, emit) async {
      emit(ImageGenerationsInProgressState());
      List<ImageGenerationsModel> list =
          await _imageGenerationsRepo.generateImageFromText(
              event.prompText, event.imgSize, event.imgNumber);
      emit(ImageGenerationsSuccessState(imageGenerations: list));
    });

    on<ClearResults>((event, emit) async {
      emit(ImageGenerationsInProgressState());
      emit(ImageGenerationsSuccessState(imageGenerations: []));
    });
  }
}
