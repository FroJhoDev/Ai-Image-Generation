import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_instagram_post_bloc.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class GenerationInstagramPostSubmitButtonComponent extends StatelessWidget {
  const GenerationInstagramPostSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      buttonText: 'Gerar Postagem',
      buttonFunction: () {
        context
            .read<GenerationInstagramPostBloc>()
            .add(const GenerationInstagramSubmitButtonPressedEvent());
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
