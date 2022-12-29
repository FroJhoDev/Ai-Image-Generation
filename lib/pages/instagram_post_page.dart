import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:ai_image_generetor/widgets/primary_button_widget.dart';
import 'package:ai_image_generetor/widgets/secondary_button_widget.dart';

class InstagramPostPage extends StatefulWidget {
  const InstagramPostPage({super.key});

  @override
  State<InstagramPostPage> createState() => _InstagramPostPageState();
}

class _InstagramPostPageState extends State<InstagramPostPage> {
  final TextEditingController _textEditingControllerImage =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Descreva a imagem da postagem',
              hintText:
                  'Ex: Uma sanduíche com carne e alface em uma mesa, fundo preto',
              prefixIcon: InkWell(
                  onTap: () => {_textEditingControllerImage.clear()},
                  child: const Icon(Icons.close)),
            ),
            controller: _textEditingControllerImage,
          ),
          const SizedBox(height: 15.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Descreva a legenda da postagem',
              hintText:
                  'Ex: Promoção de sanduíche de uma lanchonete em São Paulo',
              prefixIcon: InkWell(
                  onTap: () => {_textEditingControllerImage.clear()},
                  child: const Icon(Icons.close)),
            ),
            controller: _textEditingControllerImage,
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                  child: PrimaryButtonWidget(
                buttonText: 'Gerar Post',
                buttonFunction: () {},
              )),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: SecondaryButtonWidget(
                  buttonText: 'Resetar',
                  buttonFunction: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 5.0,
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(MdiIcons.dotsVertical, size: 25, color: Colors.grey),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/tips_img_06.jpeg',
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const  Icon(MdiIcons.heartOutline, size: 25, color: Colors.grey),
                            const SizedBox(width: 5),
                            const Icon(MdiIcons.chatOutline, size: 25, color: Colors.grey),
                            const SizedBox(width: 5),
                            const Icon(MdiIcons.sendOutline, size: 25, color: Colors.grey),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Icon(MdiIcons.bookmarkOutline, size: 25, color: Colors.grey),
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
                                child: Text(
                                    'German palace gardens and towers | oil painting, trending in artstation, anime.')),
                          ],
                        ),
                      ),                      
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    '#SãoPaulo #Food #Restaurante #Comida #Culinária #Gastronomia #Jantar #Almoço #CafédaManhã #FoodLovers #Saboreie #Sabores #GostaDeComer #AmantesDeComida #SaborandoSãoPaulo')),
                          ],
                        ),
                      ),                      
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
