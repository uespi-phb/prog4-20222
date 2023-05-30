import 'package:flutter/material.dart';
import 'package:meals/pages/meal_detail_page.dart';
import 'package:meals/pages/settings_page.dart';
import 'package:provider/provider.dart';

import '../data/meals_provider.dart';
import '../models/category.dart';
import '../models/meal.dart';
import './app_routes.dart';
import '../pages/category_meals_page.dart';
import '../pages/main_page.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MealsProvider>(
      create: (_) => MealsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tudo Gostoso!',
        theme: ThemeData(
          colorSchemeSeed: Colors.pink,
          brightness: Brightness.light,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1.0),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        initialRoute: AppRoutes.root,
        routes: {
          AppRoutes.root: (context) => const MainPage(),
          AppRoutes.settings: (context) => const SettingsPage(),
          AppRoutes.categoryMeals: (context) {
            final category =
                ModalRoute.of(context)?.settings.arguments as Category;
            return CategoryMealsPage(category: category);
          },
          AppRoutes.mealDetail: (context) {
            final meal = ModalRoute.of(context)?.settings.arguments as Meal;
            return MealDetailPage(meal: meal);
          }
        },
      ),
    );
  }
}
