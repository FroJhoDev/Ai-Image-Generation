import 'package:flutter/material.dart';

import 'package:ai_image_generetor/core/download_image_function.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/widgets/image_dialog_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

// class GenerationOfImagesCardImageComponent extends StatelessWidget {
//   final String imageUrl;
//   const GenerationOfImagesCardImageComponent({
//     Key? key,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 8.0,
//       child: Column(
//         children: [
//           Expanded(
//             child: InkWell(
//               onTap: () async {
//                 await showDialog(
//                   context: context,
//                   builder: (_) => imageDialogWidget(
//                     imageUrl: imageUrl,
//                     context: context,
//                   ),
//                 );
//               },
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           ButtonBar(
//             alignment: MainAxisAlignment.end,
//             buttonPadding: const EdgeInsets.all(0),
//             children: <Widget>[
//               IconButton(
//                 onPressed: (() => downloadImageFunction(imageUrl, context)),
//                 icon: const Icon(Icons.download),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }