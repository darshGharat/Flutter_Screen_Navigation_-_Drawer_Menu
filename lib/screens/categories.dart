import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/category_grid_item.dart';
import 'package:meal_app/models/category.dart';

class Categories extends StatelessWidget {
  const Categories(this.availableMeals, {super.key});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category data) {
    final filteredMeal =
        availableMeals.where((meal) => meal.categories.contains(data.id)).toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => Meals(
                  title: data.title,
                  mealList: filteredMeal
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: availableCategories
          .map((data) =>
              CategoryGridItem(data: data, selectCategory: _selectCategory))
          .toList()
      /* [for( final category in availableCategories)
            CategoryGridItem(data: category,)]*/
      ,
    );
  }
}
