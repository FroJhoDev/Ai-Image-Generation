import 'package:flutter/material.dart';

import '../styles/color_schema.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
    color: kSecondaryColor,
    backgroundColor: kIconButtonColor,
      ),
    );
  }
}
