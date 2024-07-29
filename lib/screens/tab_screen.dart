import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/maain_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> _favoriteMeal = [];

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onDrawerSelect(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'meals') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => Meals(
                    mealList: _favoriteMeal,
                    updateFav: _updateFavorite,
                  )));
    } else {
      final result = await Navigator.push<Map<Filter, bool>>(context,
              MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilter:  _selectedFilters))) ??
          kInitialFilters;

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  void _updateFavorite(Meal meal) {
    var isMealExists = _favoriteMeal.contains(meal);

    setState(() {
      if (isMealExists) {
        _favoriteMeal.remove(meal);
        showSnackBar("Meal is removed from favorite");
      } else {
        _favoriteMeal.add(meal);
        showSnackBar("Meal added in favorite");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget widget = Categories(_updateFavorite, availableMeals);

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      widget = Meals(
        mealList: _favoriteMeal,
        updateFav: _updateFavorite,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: onDrawerSelect,
      ),
      body: widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
