import 'package:flutter/material.dart';

import './pages/main_page.dart';
import 'consts.dart';

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC',
      theme: ThemeData.dark().copyWith(
        primaryColor: kUnselectedColor,
        scaffoldBackgroundColor: kSelectedColor,
      ),
      home: const MainPage(),
    );
  }
}
