import 'package:flutter/material.dart';
import 'package:meals/data/meals_provider.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../widgets/meal_card.dart';

class CategoryMealsPage extends StatelessWidget {
  final Category category;

  const CategoryMealsPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<MealsProvider>(context).categoryMeals(category);

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
