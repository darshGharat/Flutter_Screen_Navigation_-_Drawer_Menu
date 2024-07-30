import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier() : super({Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegan : false,
  Filter.vegetarian : false});

  void setFilters(Map<Filter, bool> choosenFilters){
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool isChecked) {
    state = {...state, filter: isChecked};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter,bool>>((ref) {
  return FilterNotifier();
});

final filteredMealsProvider = Provider((ref){
  final selectedFilters = ref.watch(filterProvider);
  final meals = ref.watch(mealsProvider);
  return meals.where((meal) {
  if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
  }).toList();
});