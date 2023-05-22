import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/information_box.dart';

class MealDetailPage extends StatefulWidget {
  final Meal meal;

  const MealDetailPage({
    super.key,
    required this.meal,
  });

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Widget _ingredientToWidget(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.amber.shade200,
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Text(text),
    );
  }

  Widget _stepToWidget(BuildContext context, int index) {
    return ListTile(
      minLeadingWidth: 10.0,
      leading: CircleAvatar(
        radius: 15.0,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).canvasColor,
        child: Text('${index + 1}'),
      ),
      title: Text(widget.meal.steps[index],
          style: const TextStyle(
            fontSize: 12.0,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ingredients =
        widget.meal.ingredients.map(_ingredientToWidget).toList();
    final steps = List.generate(
        widget.meal.steps.length, (index) => _stepToWidget(context, index));

    // final steps = meal.steps.map(_stepToWidget).toList();

    debugPrint('build()');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade400,
        foregroundColor: Colors.grey.shade700,
        child: Icon(
          widget.meal.isFavorite ? Icons.star : Icons.star_border_outlined,
        ),
        onPressed: () {
          setState(() {
            widget.meal.toggleFavorite();
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.meal.imageUrl,
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
