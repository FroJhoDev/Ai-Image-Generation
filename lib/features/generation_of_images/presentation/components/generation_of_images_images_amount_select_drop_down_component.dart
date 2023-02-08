import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_of_images_bloc.dart';

class GenerationOfImagesImagesAmountSelectDropdownComponent
    extends StatefulWidget {
  const GenerationOfImagesImagesAmountSelectDropdownComponent({super.key});

  @override
  State<GenerationOfImagesImagesAmountSelectDropdownComponent> createState() =>
      _GenerationOfImagesImagesAmountSelectDropdownComponentState();
}

class _GenerationOfImagesImagesAmountSelectDropdownComponentState
    extends State<GenerationOfImagesImagesAmountSelectDropdownComponent> {
  String _defaultImageAmount = '4';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _defaultImageAmount,
      items: _imgAmountDropdownList,
      onChanged: ((value) {
        context.read<GenerationOfImagesBloc>().add(
            SelectImagesAmountChangedEvent(imagesAmount: value.toString()));
        setState(() {
          _defaultImageAmount = value.toString();
        });
      }),
    );
  }

  List<DropdownMenuItem<String>> get _imgAmountDropdownList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "4", child: Text("4")),
      DropdownMenuItem(value: "6", child: Text("6")),
      DropdownMenuItem(value: "8", child: Text("8")),
      DropdownMenuItem(value: "10", child: Text("10")),
    ];
    return menuItems;
  }
}
