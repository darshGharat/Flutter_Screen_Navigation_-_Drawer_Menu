import 'package:flutter/material.dart';
import 'package:meal_app/screens/tab_screen.dart';

var themeColor = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(31, 176, 84, 4));

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: themeColor,
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: themeColor.onSecondaryContainer))),
      home: const TabScreen(),
    );
  }
}
