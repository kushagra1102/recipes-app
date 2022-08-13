import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_apps/classes/meals_class.dart';
import 'package:meals_apps/data/food_recipes_data.dart';

class MealsDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.title == title);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFFAF2B0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            TitleWidget("Ingredients"),
            ListBox(
              ListView.builder(
                itemBuilder: (ctx, index) => IngredientsCard(
                  selectedMeal: selectedMeal,
                  index: index,
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            TitleWidget("Recipe"),
            ListBox(
              ListView.builder(
                itemBuilder: (ctx, index) => StepsCard(
                  selectedMeal: selectedMeal,
                  index: index,
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListBox extends StatelessWidget {
  final Widget child;
  ListBox(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }
}

class TitleWidget extends StatelessWidget {
  final text;
  TitleWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class IngredientsCard extends StatelessWidget {
  final Meal selectedMeal;
  final int index;
  IngredientsCard({required this.selectedMeal, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      color: Colors.amberAccent,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          selectedMeal.ingredients[index],
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class StepsCard extends StatelessWidget {
  final Meal selectedMeal;
  final int index;
  StepsCard({required this.selectedMeal, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        selectedTileColor: Colors.amberAccent,
        tileColor: Colors.amberAccent,
        title: Text(
          selectedMeal.steps[index],
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: Colors.indigoAccent,
          child: Text(
            "# ${index + 1}",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
