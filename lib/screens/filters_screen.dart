import 'package:flutter/material.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:meal_app/widget/drawer_item.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: const Column(
          children: [
            DrawerItem(
                title: 'Gluten-free',
                subtitle: 'Only include Gluten-free meal',
                filter: Filter.glutenFree,),
            DrawerItem(
                title: 'Lactose-free',
                subtitle: 'Only include Lactose-free meal',
                filter: Filter.lactoseFree,),
            DrawerItem(
                title: 'Vegan',
                subtitle: 'Only include Vegan meal',
                filter: Filter.vegan,),
            DrawerItem(
                title: 'Vegiterian',
                subtitle: 'Only include Vegiterian meal',
                filter: Filter.vegetarian,)
          ],
      )
    );
  }
}
