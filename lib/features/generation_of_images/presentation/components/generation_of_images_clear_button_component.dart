import 'package:flutter/material.dart';

import 'package:ai_image_generetor/core/widgets/secondary_button_widget.dart';

class GenerationOfImagesClearButtonComponent extends StatelessWidget {
  const GenerationOfImagesClearButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButtonWidget(
      buttonText: 'Limpar',
      buttonFunction: () {},
    );
  }
}
