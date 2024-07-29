import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:meal_app/widget/drawer_item.dart';
import 'package:meal_app/widget/meal_list_item.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});

  final Map<Filter, bool> currentFilter;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenChecked = false;
  var isLactoseChecked = false;
  var isVeganChecked = false;
  var isVegiterionChecked = false;

  @override
  void initState() {
    super.initState();
    isGlutenChecked = widget.currentFilter[Filter.glutenFree]!;
    isLactoseChecked = widget.currentFilter[Filter.lactoseFree]!;
    isVeganChecked = widget.currentFilter[Filter.vegan]!;
    isVegiterionChecked = widget.currentFilter[Filter.vegetarian]!;
  }

  void _filterList(bool isChecked, String title){
    setState(() {
      if(title == 'Gluten-free'){
        isGlutenChecked = isChecked;
      }
      if(title == 'Lactose-free'){
        isLactoseChecked = isChecked;
      }
      if(title == 'Vegan'){
        isVeganChecked = isChecked;
      }
      if(title == 'Vegiterian'){
        isVegiterionChecked = isChecked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenChecked,
            Filter.lactoseFree: isLactoseChecked,
            Filter.vegetarian: isVegiterionChecked,
            Filter.vegan: isVeganChecked,
          });
        },
        child: Column(
          children: [
            DrawerItem(
                title: 'Gluten-free',
                subtitle: 'Only include Gluten-free meal',
                onChanged: _filterList,
                isChecked: isGlutenChecked),
            DrawerItem(
                title: 'Lactose-free',
                subtitle: 'Only include Lactose-free meal',
                onChanged: _filterList,
                isChecked: isLactoseChecked),
            DrawerItem(
                title: 'Vegan',
                subtitle: 'Only include Vegan meal',
                onChanged: _filterList,
                isChecked: isVeganChecked),
            DrawerItem(
                title: 'Vegiterian',
                subtitle: 'Only include Vegiterian meal',
                onChanged: _filterList,
                isChecked: isVegiterionChecked),
          ],
        ),
      ),
    );
  }
}
