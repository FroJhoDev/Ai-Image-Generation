import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generation_of_images_bloc.dart';

class GenerationOfImagesImageResolutionSelectDropdownComponent extends StatefulWidget {
  const GenerationOfImagesImageResolutionSelectDropdownComponent({super.key});

  @override
  State<GenerationOfImagesImageResolutionSelectDropdownComponent> createState() =>
      _GenerationOfImagesImageResolutionSelectDropdownComponentState();
}

class _GenerationOfImagesImageResolutionSelectDropdownComponentState
    extends State<GenerationOfImagesImageResolutionSelectDropdownComponent> {
  String _defaultImageResolution = '256x256';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _defaultImageResolution,
      items: _imageResolutionDropdownList,
      onChanged: ((value) {
        context.read<GenerationOfImagesBloc>().add(
            SelectImageResolutionChangedEvent(
                imageResoluion: value.toString()));
        setState(() {
          _defaultImageResolution = value.toString();
        });
      }),
    );
  }

  List<DropdownMenuItem<String>> get _imageResolutionDropdownList {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "256x256", child: Text("256x256")),
      DropdownMenuItem(value: "512x512", child: Text("512x512")),
      DropdownMenuItem(value: "1024x1024", child: Text("1024x1024")),
    ];
    return menuItems;
  }
}
