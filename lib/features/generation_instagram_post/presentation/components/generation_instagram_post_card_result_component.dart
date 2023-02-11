import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/helpers/download_image_helper.dart';
import '../../../../core/styles/color_schema.dart';
import '../bloc/generation_instagram_post_bloc.dart';
import '../../../../core/helpers/copy_to_clipboard_helper.dart';
import '../../../../core/widgets/custom_circular_progress_widget.dart';
import '../../../../core/widgets/secondary_button_widget.dart';

class GenerationInstagramPostCardResultComponent extends StatelessWidget {
  const GenerationInstagramPostCardResultComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerationInstagramPostBloc,
        GenerationInstagramPostState>(
      builder: (context, state) {
        if (state.status == GenerationInstagramPostStatus.loading) {
          return const CustomCircularProgressWidget();
        } else if (state.status == GenerationInstagramPostStatus.success) {
          return Expanded(
              child: SingleChildScrollView(
            child: Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(MdiIcons.dotsVertical,
                            size: 25, color: Colors.grey),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Image.network(
                        state.postGenerated!.postImage,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          onPressed: () => downloadImageFunction(
                              state.postGenerated!.postImage, context),
                          icon: const Icon(
                            MdiIcons.download,
                            color: kSecondaryColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(MdiIcons.heartOutline,
                            size: 25, color: Colors.grey),
                        const SizedBox(width: 5),
                        const Icon(MdiIcons.chatOutline,
                            size: 25, color: Colors.grey),
                        const SizedBox(width: 5),
                        const Icon(MdiIcons.sendOutline,
                            size: 25, color: Colors.grey),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(MdiIcons.bookmarkOutline,
                                  size: 25, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5.0, top: 5.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(state.postGenerated!.postDescription)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(state.postGenerated!.postHashtags)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SecondaryButtonWidget(
                      buttonText: 'Copiar Legenda e Hashtags',
                      buttonFunction: () => copyToClipboardHelper(
                          state.postGenerated!.postDescription +
                              state.postGenerated!.postHashtags,
                          context),
                    ),
                  ),
                ],
              ),
            ),
          ));
        } else {
          return const Expanded(
            child: Center(
              child: Text('Preencha os campos e toque em Gerar o Postagem'),
            ),
          );
        }
      },
    );
  }
}
