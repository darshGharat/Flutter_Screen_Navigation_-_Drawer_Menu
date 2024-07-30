import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filter_provider.dart';

class DrawerItem extends ConsumerWidget{
  const DrawerItem({super.key, required this.title, required this.subtitle, required this.filter});

  final String title;
  final String subtitle;
  final Filter filter;
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    
    return SwitchListTile(
            value: activeFilter[filter]!,
            onChanged: (value) => { ref.read(filterProvider.notifier).setFilter(filter, value)},
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
                
            ),
            subtitle: Text(subtitle,style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface), ),
                  activeColor:  Theme.of(context).colorScheme.tertiary,
                  contentPadding: const EdgeInsets.only(left: 25,right: 25),
          );
  }
}