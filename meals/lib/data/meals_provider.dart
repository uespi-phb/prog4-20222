import 'package:flutter/widgets.dart';
import 'package:meals/data/categories.dart';
import 'package:meals/models/category.dart';

import '../models/app_settings.dart';
import 'meals.dart';
import '../models/meal.dart';

class MealsProvider with ChangeNotifier {
  final List<Meal> meals = kMeals;
  final List<Category> categories = kCategories;
  final AppSettings settings = AppSettings();

  List<Meal> categoryMeals(Category category) {
    return meals.where((meal) {
      bool flag = true;

      if (settings.isGlutenFree) {
        flag = flag && meal.isGlutenFree;
      }
      if (settings.isLactoseFree) {
        flag = flag && meal.isLactoseFree;
      }
      if (settings.isVegetarian) {
        flag = flag && meal.isVegetarian;
      }
      if (settings.isVegan) {
        flag = flag && meal.isVegan;
      }

      return flag && meal.categories.contains(category.id);
    }).toList();
  }

  List<Meal> favoriteMeals() => meals.where((meal) => meal.isFavorite).toList();

  void toggleFavorite(Meal meal) {
    meal.isFavorite = !meal.isFavorite;
    notifyListeners();
  }

  void toggleGlutenFree() {
    settings.isGlutenFree = !settings.isGlutenFree;
    notifyListeners();
  }

  void toggleLactoseFree() {
    settings.isLactoseFree = !settings.isLactoseFree;
    notifyListeners();
  }

  void toggleVegetarian() {
    settings.isVegetarian = !settings.isVegetarian;
    notifyListeners();
  }

  void toggleVegan() {
    settings.isVegan = !settings.isVegan;
    notifyListeners();
  }
}
