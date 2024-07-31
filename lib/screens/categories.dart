import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/category_grid_item.dart';
import 'package:meal_app/models/category.dart';

class Categories extends StatefulWidget {
  const Categories(this.availableMeals, {super.key});

  final List<Meal> availableMeals;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationConroller;

  @override
  void initState() {
    super.initState();
    _animationConroller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationConroller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationConroller.dispose();
  }

  void _selectCategory(BuildContext context, Category data) {
    final filteredMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(data.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                Meals(title: data.title, mealList: filteredMeal)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationConroller,
        child: GridView(
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
        ),
        builder: (context, child1) => SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: _animationConroller, curve: Curves.easeInOut)),
                    child: child1,));
  }
}
