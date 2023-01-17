import 'package:flutter/material.dart';

import 'package:ai_image_generetor/widgets/prompt_example_card_widget.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15.0),
            const Text(
              'Dicas',
              style: TextStyle(
                fontSize: 22.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15.0),
            const Text(
              'O campo de texto é usado para descrever a imagem, a resolução define a resolução das imagens geradas e campo numérico a quantidade de resultados. Quanto maior a resolução e a quantidade solícitas, maior vai ser o tempo de processamento e consumo de dados.',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'O campo de texto onde inserimos a descrição das imagens a serem geradas é chamado de "prompt".',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Diferente de um site de pesquisa como o Google, o prompt não tem o objetivo de descrever uma imagem a ser buscada, e sim dá uma série de comandos específicos para fazer a IA (Inteligência artificial) compreender a imagem que deve ser gerada.',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Para isso o texto deve ser escrito em inglês, e descrever de forma mais clara possível o resultado esperado.',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Por exemplo, se você quer imagens de um "Panda vermelho vestido de cavaleiro medieval", deve escrever algo do tipo "A digital illustration of a red panda wearing a knight armor, with sword".',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 5,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/red_panda_ia.jpeg',
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Além de descrever detalhes e tipo de arte, informa padrões que podem ser usados de exemplo também ajuda em melhores resultados. Por exemplo, se você quer que seu cavaleiro panda tenha o estilo dos desenhos da Pixar, pode adicionar ao final do comando o trecho "Pixar style 3D".',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 5,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/red_panda_ia_pixar.jpeg',
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'É possível solicitar artes de estilos específicos ou com traços padrões de certos artistas, como por exemplo nosso panda desenhado por Van Gogh.',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 5,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/red_panda_ia_van_gogh.jpeg',
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Abaixo algumas imagens e os prompts que foram usados:',
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15.0),
            const PromptExapleCardWidget(
              imageUrl: 'assets/images/tips_img_01.jpeg',
              promptText:
                  'Pixar style 3D render of a baby hippo, 4k, high resolution, trending in artstation',
            ),
            const SizedBox(height: 10.0),
            const PromptExapleCardWidget(
              imageUrl: 'assets/images/tips_img_02.jpeg',
              promptText:
                  'Pixar style 3D render of a fox wearing a tophat, 4k, high resolution, trending in artstation',
            ),
            const SizedBox(height: 10.0),
            const PromptExapleCardWidget(
              imageUrl: 'assets/images/tips_img_03.jpeg',
              promptText:
                  'An oil painting of a mechanical clockwork flying machine from the renaissance, Gorgeous digital painting, amazing art, artstation 3, realistic',
            ),
            const SizedBox(height: 10.0),
            const PromptExapleCardWidget(
              imageUrl: 'assets/images/tips_img_04.jpeg',
              promptText:
                  'fantasy tavern interior | Breath-taking digital painting with warm colours amazing art mesmerizing, captivating, artstation 3',
            ),
            const SizedBox(height: 10.0),
            const PromptExapleCardWidget(
              imageUrl: 'assets/images/tips_img_05.jpeg',
              promptText:
                  'Cluttered house in the woods | anime oil painting high resolution cottagecore ghibli inspired 4k',
            ),
            const SizedBox(height: 10.0),
            const PromptExapleCardWidget(
              imageUrl: 'assets/images/tips_img_06.jpeg',
              promptText:
                  'German palace gardens and towers | oil painting, trending in artstation, anime',
            ),
          ],
        ),
      ),
    ));
  }
}
