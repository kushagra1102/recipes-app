import 'package:flutter/material.dart';
import 'package:meals_apps/data/food_categories_data.dart';
import 'package:meals_apps/widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: categories
          .map((catData) => CategoryCard(
                title: catData.title,
                color: catData.color,
                id: catData.id,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
