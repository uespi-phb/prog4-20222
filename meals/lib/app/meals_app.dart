import 'package:flutter/material.dart';
import 'package:meals/pages/category_page.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tudo Gostoso!',
      theme: ThemeData(
        primaryColor: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1.0),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: const CategoryPage(),
    );
  }
}
