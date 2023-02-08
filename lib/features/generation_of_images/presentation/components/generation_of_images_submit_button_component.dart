import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_of_images_bloc.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class GenerationOfImagesSubmitButtonComponent extends StatelessWidget {
  const GenerationOfImagesSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      buttonText: 'Gerar Imagens',
      buttonFunction: () {
        context
            .read<GenerationOfImagesBloc>()
            .add(const GenerationImagesSubmitButtonPressedEvent());
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
