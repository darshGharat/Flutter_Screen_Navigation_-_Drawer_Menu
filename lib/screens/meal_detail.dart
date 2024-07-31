import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/provider/favorites_provider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({super.key, required this.meal});

  final Meal meal;
  // final void Function(Meal meal) updateFav;

  @override
  Widget build(BuildContext context, WidgetRef wRef) {
    final favMeals = wRef.watch(favMealsProvider);

    final isFavMeal = favMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
              onPressed: () {
                bool isSaved = wRef
                    .read(favMealsProvider.notifier)
                    .toggleFavoriteMeal(meal);
                // updateFav(meal);
                if (isSaved) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Meal Added in FAvorite List")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Meal removed from List")));
                }
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavMeal ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavMeal),
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: meal.id, child: Image.network(meal.imageUrl)),
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
