import 'package:ai_image_generetor/core/color_schema.dart';
import 'package:ai_image_generetor/features/generation_of_images/presentation/pages/generation_of_images_page.dart';
import 'package:ai_image_generetor/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:ai_image_generetor/pages/home_page.dart';
import 'package:ai_image_generetor/pages/text_completions_page.dart';
import 'package:ai_image_generetor/pages/instagram_post_page.dart';
import 'package:ai_image_generetor/pages/chat_ai_page.dart';
import 'package:ai_image_generetor/pages/historic_page.dart';
import 'package:ai_image_generetor/pages/tips_page.dart';
import 'package:ai_image_generetor/core/api_constants.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;

  const BottomNavigationBarWidget({super.key, required this.currentIndex});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final _bottomBarPageController = PageController();
  int _bottomNavigatorBarCurrentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      GenerationOfImagesPage(),
      const TextCompletionsPage(),
      const InstagramPostPage(),
      const ChatAIPage(),
      const HistoricPage(),
      const TipsPage(),
    ];

    _bottomNavigatorBarCurrentIndex = widget.currentIndex;

    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IA Generation'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Histórico'),
                onTap: () {
                  _bottomBarPageController.jumpToPage(4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(MdiIcons.headLightbulbOutline),
                title: const Text('Modo de Uso'),
                onTap: () {
                  _bottomBarPageController.jumpToPage(5);
                  Navigator.pop(context);
                },
              ),
              SwitchListTile(
                value: currentTheme.get(),
                onChanged: (bool value) {
                  currentTheme.switchTheme();
                },
                secondary: currentTheme.get() ? const Icon(MdiIcons.lightbulbOutline) : const Icon(MdiIcons.lightbulbOnOutline),
                title: const Text('Tema Escuro'),
                activeColor: kSecondaryColor,
              ),
              ListTile(
                leading: const Icon(MdiIcons.informationOutline),
                title: const Text('Sobre o App'),
                onTap: () {
                  // _bottomBarPageController.jumpToPage(6);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _bottomBarPageController,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavigatorBarCurrentIndex,
          onTap: (index) {
            setState(() {
              _bottomNavigatorBarCurrentIndex = index;
            });
            _bottomBarPageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Imagens', icon: Icon(MdiIcons.imageFrame)),
            BottomNavigationBarItem(
                label: 'Textos', icon: Icon(MdiIcons.cardTextOutline)),
            BottomNavigationBarItem(
                label: 'Instagram', icon: Icon(MdiIcons.instagram)),
            BottomNavigationBarItem(
                label: 'Chat IA', icon: Icon(MdiIcons.commentOutline)),
            // BottomNavigationBarItem(
            //     label: 'Histórico', icon: Icon(Icons.history)),
            // BottomNavigationBarItem(
            //     label: 'Dicas', icon: Icon(Icons.lightbulb_outline)),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kPrimaryColor,
        ),
      ),
    );
  }
}
