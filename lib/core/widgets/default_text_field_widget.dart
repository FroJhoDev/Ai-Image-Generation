import 'package:flutter/material.dart';

import '../styles/color_schema.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final void Function(String)? onChangedFunction;

  DefaultTextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.onChangedFunction,
  });

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        hintText: hintText,
        prefixIcon: InkWell(
            onTap: () => {_textEditingController.clear()},
            child: const Icon(Icons.close, color: kIconButtonColor)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kIconButtonColor),
        ),
      ),
      controller: _textEditingController,
      onChanged: onChangedFunction,
    );
  }
}
