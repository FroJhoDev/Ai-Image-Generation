import 'package:ai_image_generetor/core/widgets/custom_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/image_dialog_widget.dart';
import '../../../../core/helpers/download_image_helper.dart';

class GenerationOfImagesCardImageComponent extends StatelessWidget {
  final String imageUrl;
  const GenerationOfImagesCardImageComponent({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Stack(
        children: [
          InkWell(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (_) => imageDialogWidget(
                  imageUrl: imageUrl,
                  context: context,
                ),
              );
            },
            child: SizedBox(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const CustomCircularProgressWidget(),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              color: Colors.white,
              iconSize: 34,
              icon: const Icon(MdiIcons.downloadCircle),
              onPressed: (() => downloadImageFunction(imageUrl, context)),
            ),
          ),
        ],
      ),
    );
  }
}
