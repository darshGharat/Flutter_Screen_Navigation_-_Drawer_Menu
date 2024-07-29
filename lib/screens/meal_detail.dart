import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal, required this.updateFav});

  final Meal meal;
  final void Function(Meal meal) updateFav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
              onPressed: () {
                updateFav(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Ingredient',
              style: TextStyle(
                  color: Color.fromARGB(255, 150, 93, 93),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingre in meal.ingredients)
              Text(ingre,
                  style: const TextStyle(color: Colors.black, fontSize: 20)),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                  color: Color.fromARGB(255, 150, 93, 93),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    step,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ))
          ],
        ),
      ),
    );
  }
}
