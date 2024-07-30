import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class MealNotifier extends StateNotifier<List<Meal>>{
  MealNotifier() : super([]);
  bool toggleFavoriteMeal(Meal meal) {
    final isFavoriteMeal = state.contains(meal);

    if(isFavoriteMeal){
      state = state.where((m)=> m.id != meal.id).toList();
      return false;
    }else{
      state = [...state , meal];
      return true;
    }
  }

}

final favMealsProvider = StateNotifierProvider<MealNotifier, List<Meal>>((ref){
  return MealNotifier();
});