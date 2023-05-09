import 'package:flutter/material.dart';

import './pages/main_page.dart';
import './pages/result_page.dart';
import './models/bmi_data.dart';
import './routes.dart';
import './consts.dart';

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

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
        Routes.root: (_) => const MainPage(),
        Routes.result: (context) {
          final data = ModalRoute.of(context)!.settings.arguments as BmiData;
          return ResultPage(bmiData: data);
        },
      },
    );
  }
}
