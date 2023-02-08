import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/secondary_button_widget.dart';
import '../bloc/generation_of_images_bloc.dart';

class GenerationOfImagesClearButtonComponent extends StatelessWidget {
  const GenerationOfImagesClearButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButtonWidget(
      buttonText: 'Limpar',
      buttonFunction: () {
        context
            .read<GenerationOfImagesBloc>()
            .add(const GenerationImagesClearStateButtonPressedEvent());
      },
    );
  }
}
