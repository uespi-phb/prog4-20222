import 'package:flutter/material.dart';

import '../data/database.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_card.dart';

class CategoryMealsPage extends StatelessWidget {
  final Category category;

  const CategoryMealsPage({
    super.key,
    required this.category,
  });

  List<Meal> _mealsList() {
    return Database.meals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final meals = _mealsList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: meals.length,
        itemBuilder: (_, index) => MealCard(meals[index]),
      ),
    );
  }
}
