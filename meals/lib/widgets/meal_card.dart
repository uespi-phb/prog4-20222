import 'package:flutter/material.dart';

import '../app/app_routes.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard(this.meal, {super.key});

  // ignore: unused_element
  String _mealFlags(Meal meal) {
    String flags = '';

    if (meal.isGlutenFree) {
      flags = '${flags}G';
    }
    if (meal.isLactoseFree) {
      flags = '${flags}L';
    }
    if (meal.isVegetarian) {
      flags = '${flags}V';
    }
    if (meal.isVegan) {
      flags = '${flags}X';
    }
    return flags;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.mealDetail,
          arguments: meal,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Stack(
              // alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 5.0,
                  bottom: 15.0,
                  child: Container(
                    width: 220.0,
                    color: Colors.black54,
                    // margin: const EdgeInsets.symmetric(
                    //   horizontal: 8.0,
                    //   vertical: 15.0,
                    // ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(meal.complexity.string),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(meal.cost.string),
                    ],
                  ),
                ],
              ),
            ),
            // Text(_mealFlags(meal)),
          ],
        ),
      ),
    );
  }
}
