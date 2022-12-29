import 'package:flutter/material.dart';

import 'package:ai_image_generetor/widgets/bottom_navigation_bar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(1, 81, 89, 1),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color.fromRGBO(1, 46, 64, 1),
              displayColor: const Color.fromRGBO(1, 46, 64, 1)
            ),
      ),
      home: const BottomNavigationBarWidget(currentIndex: 0),
    );
  }
}
