import 'package:flutter/material.dart';
import 'package:ai_image_generetor/constants.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Center(
      child: CircularProgressIndicator(
        color: kSecondaryColor,
        backgroundColor: kIconButtonColor,
      ),
    ));
  }
}
