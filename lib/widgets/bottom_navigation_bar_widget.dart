import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:ai_image_generetor/pages/home_page.dart';
import 'package:ai_image_generetor/pages/text_completions_page.dart';
import 'package:ai_image_generetor/pages/instagram_post_page.dart';
import 'package:ai_image_generetor/pages/historic_page.dart';
import 'package:ai_image_generetor/pages/tips_page.dart';
import 'package:ai_image_generetor/constants.dart';

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
    pages = const [
      HomePage(),
      TextCompletionsPage(),
      InstagramPostPage(),
      HistoricPage(),
      TipsPage(),
    ];

    _bottomNavigatorBarCurrentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IA Generation'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(MdiIcons.menu))
        ],
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
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Imagens', icon: Icon(MdiIcons.imageFrame)),
          BottomNavigationBarItem(
              label: 'Textos', icon: Icon(MdiIcons.cardTextOutline)),
          BottomNavigationBarItem(
              label: 'Instagram', icon: Icon(MdiIcons.instagram)),
          BottomNavigationBarItem(
              label: 'Histórico', icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              label: 'Dicas', icon: Icon(Icons.lightbulb_outline)),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kPrimaryColor,
      ),
    );
  }
}