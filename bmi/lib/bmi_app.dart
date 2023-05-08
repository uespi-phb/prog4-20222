import 'package:flutter/material.dart';

import './pages/main_page.dart';
import './pages/result_page.dart';
import './routes.dart';
import './consts.dart';

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
      initialRoute: Routes.root,
      routes: {
        Routes.root: (context) => const MainPage(),
        Routes.result: (context) => const ResultPage(),
      },
    );
  }
}
