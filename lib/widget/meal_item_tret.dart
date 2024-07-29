import 'package:flutter/material.dart';

class MealItemTret extends StatelessWidget{
  const MealItemTret(this.data , this.label, {super.key});

  final IconData data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(data, color: Colors.white,),
      const SizedBox(width: 2,),
      Text(label, style: const TextStyle(color: Colors.white70),)
    ],);
  
  }
}