import 'package:flutter/material.dart';
import 'package:meals_apps/data/food_recipes_data.dart';
import 'package:meals_apps/widgets/meal_card.dart';

class FoodItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final receivedArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = receivedArguments['title']!;
    final String categoryId = receivedArguments['id']!;
    final selectedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFFAF2B0),
      body: ListView.builder(
        itemCount: selectedMeals.length,
        itemBuilder: (context, index) {
          return MealCard(
            id: selectedMeals[index].id,
            title: selectedMeals[index].title,
            imageUrl: selectedMeals[index].imageUrl,
            duration: selectedMeals[index].duration,
            affordability: selectedMeals[index].affordability,
            complexity: selectedMeals[index].complexity,
          );
        },
      ),
    );
  }
}
