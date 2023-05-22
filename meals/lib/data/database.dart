import '../models/meal.dart';
import './categories.dart';
import './meals.dart';

class Database {
  static final categories = kCategories;
  static final meals = kMeals;

  static List<Meal> get favoriteMeals {
    return meals.where((meal) => meal.isFavorite).toList();
  }
}
