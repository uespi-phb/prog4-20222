import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/meals_provider.dart';
import '../widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<MealsProvider>(context, listen: false).categories;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 3 / 2,
        ),
        children: categories
            .map((category) => CategoryCard(category: category))
            .toList(),
      ),
    );
  }
}
