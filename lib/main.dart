import 'package:flutter/material.dart';
import 'package:meals_apps/screens/category_screen.dart';
import 'package:meals_apps/screens/food_items_screen.dart';
import 'package:meals_apps/screens/meal_data_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber[600],
      ),
      routes: {
        '/categories': (context) => CategoryScreen(),
        '/food_items': (context) => FoodItemsScreen(),
        '/meals_data': (context) => MealsDataScreen(),
        '/tabs': (context) => TabsScreen(),
      },
    );
  }
}
