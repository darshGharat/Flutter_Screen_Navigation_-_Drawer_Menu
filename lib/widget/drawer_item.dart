
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget{
  const DrawerItem({super.key, required this.title, required this.subtitle, required this.onChanged,required this.isChecked});

  final String title;
  final String subtitle;
  final bool isChecked;
  final void Function(bool isChecked, String identifier) onChanged;
  
  @override
  Widget build(BuildContext context) {
    
    return SwitchListTile(
            value: isChecked,
            onChanged: (value) => { onChanged(value,title) },
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