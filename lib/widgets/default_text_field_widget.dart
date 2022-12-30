import 'package:ai_image_generetor/constants.dart';
import 'package:flutter/material.dart';

class DefaultTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController textEditingController;

  const DefaultTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.textEditingController});

  @override
  State<DefaultTextFieldWidget> createState() => _DefaultTextFieldWidgetState();
}

class _DefaultTextFieldWidgetState extends State<DefaultTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        hintText: widget.hintText,
        prefixIcon: InkWell(
            onTap: () => {widget.textEditingController.clear()},
            child: const Icon(Icons.close, color: kIconButtonColor)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kIconButtonColor),
        ),
      ),
      controller: widget.textEditingController,
    );
  }
}
