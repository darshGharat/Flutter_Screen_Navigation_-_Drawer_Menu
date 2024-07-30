import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/meal_list_item.dart';

class Meals extends StatelessWidget {
  const Meals(
      {super.key, this.title, required this.mealList});

  final String? title;
  final List<Meal> mealList;

  void _selectMeal(BuildContext context, Meal data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetail(
                  meal: data
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (ctx, index) => MealListItem(
              meal: mealList[index],
              selectedMeal: _selectMeal,
            ));
    if (mealList.isEmpty) {
      content = const Center(
        child: Column(
          children: [
            Text('No meals for selected category try selecting differnt')
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: content);
    }
  }
}
