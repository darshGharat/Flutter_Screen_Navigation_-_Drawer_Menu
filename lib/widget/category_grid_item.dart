import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.data , required this.selectCategory});

  final Function(BuildContext ctx, Category data, ) selectCategory;

  final Category data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          selectCategory(context,data);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(colors: [
              data.color.withOpacity(0.55),
              data.color.withOpacity(0.85)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Text(data.title, style:  Theme.of(context).textTheme.titleLarge!.copyWith(color: themeColor.onSecondary/*Theme.of(context).colorScheme.onPrimary*/),),
      ),
    );
  }
}
