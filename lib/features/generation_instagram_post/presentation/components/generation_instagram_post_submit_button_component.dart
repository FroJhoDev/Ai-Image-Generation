import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_instagram_post_bloc.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class GenerationInstagramPostSubmitButtonComponent extends StatelessWidget {
  const GenerationInstagramPostSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFormValid = false;

    return BlocListener<GenerationInstagramPostBloc,
        GenerationInstagramPostState>(
      listener: (context, state) {
        if (state.imagePromptText.isNotEmpty &&
            state.descriptionPromptText.isNotEmpty &&
            state.hashtagsPromptText.isNotEmpty) {
          isFormValid = true;
        } else {
          isFormValid = false;
        }
      },
      child: PrimaryButtonWidget(
        buttonText: 'Gerar Postagem',
        buttonFunction: () {
          if (isFormValid) {
            context
                .read<GenerationInstagramPostBloc>()
                .add(const GenerationInstagramSubmitButtonPressedEvent());
            FocusManager.instance.primaryFocus?.unfocus();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Você deve preencher todos os campos'),
              ),
            );
          }
        },
      ),
    );
  }
}
