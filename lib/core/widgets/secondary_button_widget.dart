import 'package:flutter/material.dart';

import '../styles/color_schema.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function()? buttonFunction;

  const SecondaryButtonWidget(
      {super.key, required this.buttonText, required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: buttonFunction,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 3.0,
          color: kSecondaryColor,
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(color: kSecondaryColor),
      ),
    );
  }
}
