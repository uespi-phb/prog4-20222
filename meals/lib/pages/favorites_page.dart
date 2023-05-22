import 'package:flutter/material.dart';

import '../data/database.dart';
import '../widgets/meal_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = Database.favoriteMeals;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: favoriteMeals.length,
      itemBuilder: (_, index) => MealCard(favoriteMeals[index]),
    );
  }
}
