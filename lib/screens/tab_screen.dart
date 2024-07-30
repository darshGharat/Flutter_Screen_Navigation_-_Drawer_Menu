import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/provider/favorites_provider.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widget/maain_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

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
              builder: (ctx) => const Meals(
                    mealList: dummyMeals
                  )));
    } else {
       await Navigator.push<Map<Filter, bool>>(context,
              MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals = ref.watch(filteredMealsProvider);

    Widget widget = Categories(availableMeals);

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {

      final favMeals = ref.watch(favMealsProvider);
      widget = Meals(
        mealList: favMeals
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
