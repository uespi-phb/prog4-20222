import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/information_box.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal;

  const MealDetailPage({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final ingredients = meal.ingredients.map((text) => Text(text)).toList();
    final steps = meal.steps.map((text) => Text(text)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            InformationCard(
              title: 'Ingredientes',
              child: Column(
                children: ingredients,
              ),
            ),
            InformationCard(
              title: 'Passos',
              child: Column(
                children: steps,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
