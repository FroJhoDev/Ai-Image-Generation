import 'package:flutter/material.dart';

class ImageDialogWidget extends StatelessWidget {
  final String imgUrl;

  const ImageDialogWidget({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
