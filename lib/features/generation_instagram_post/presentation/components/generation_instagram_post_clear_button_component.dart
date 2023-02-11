import 'package:ai_image_generetor/core/widgets/secondary_button_widget.dart';
import 'package:ai_image_generetor/features/generation_instagram_post/presentation/bloc/generation_instagram_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationInstagramPostClearButtonComponent extends StatelessWidget {
  const GenerationInstagramPostClearButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButtonWidget(
        buttonText: 'Limpar Resultado',
        buttonFunction: () {
          context
              .read<GenerationInstagramPostBloc>()
              .add(const GenerationInstagramClearButtonPressedEvent());
        });
  }
}
