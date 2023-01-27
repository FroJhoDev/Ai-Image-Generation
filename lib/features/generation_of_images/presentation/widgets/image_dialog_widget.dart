import 'package:flutter/material.dart';

Widget imageDialogWidget(
    {required String imageUrl, required BuildContext context}) {
  return Dialog(
    child: Container(
      height: 250.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
