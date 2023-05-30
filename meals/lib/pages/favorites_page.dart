import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/meals_provider.dart';
import '../widgets/meal_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites =
        Provider.of<MealsProvider>(context, listen: true).favoriteMeals();

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: favorites.length,
      itemBuilder: (_, index) => MealCard(favorites[index]),
    );
  }
}
