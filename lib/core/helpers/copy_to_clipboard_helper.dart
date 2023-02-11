import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> copyToClipboardHelper(String text, BuildContext context) async {
  await Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Copiado para Área de Transferência'),
    ),
  );
}
