import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shadowColor: Colors.grey.shade100,
        child: Column(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.6)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.fastfood,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                     Text(
                      'Cooking up',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary)
                      ),
                  ],
                )),
                ListTile(
                  leading: Icon(Icons.restaurant, size: 26 , color: Theme.of(context).colorScheme.primary,),
                  title: Text('Meals', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary)
                      ),
                      onTap: () => onSelectScreen('meals')),
                      ListTile(
                  leading: Icon(Icons.filter, size: 26 , color: Theme.of(context).colorScheme.primary,),
                  title: Text('Filter Screen', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary)
                      ),
                      onTap: () => onSelectScreen('filter'),),
                      
          ],
        ));
  }
}
