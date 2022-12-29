import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

void downloadImg(String url, BuildContext context) async {
  try {
    var imageId = await ImageDownloader.downloadImage(url);
    if (imageId == null) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Imagem Salva na Galeria'),
      ));
    }
  } on PlatformException catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(error.toString()),
    ));
  }
}
