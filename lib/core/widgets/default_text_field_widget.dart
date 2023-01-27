import 'package:flutter/material.dart';
import 'package:ai_image_generetor/core/color_schema.dart';

class DefaultTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final void Function(String)? onChangedFunction;

  const DefaultTextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.onChangedFunction,
  });

  @override
  State<DefaultTextFieldWidget> createState() => _DefaultTextFieldWidgetState();
}

class _DefaultTextFieldWidgetState extends State<DefaultTextFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        hintText: widget.hintText,
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
      onChanged: widget.onChangedFunction,
    );
  }
}
