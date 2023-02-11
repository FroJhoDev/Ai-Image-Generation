import 'package:flutter/material.dart';

import '../styles/color_schema.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function()? buttonFunction;

  const PrimaryButtonWidget(
      {super.key, required this.buttonText, required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor),
      child: Text(buttonText),
    );
  }
}
