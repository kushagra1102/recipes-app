import 'package:flutter/material.dart';
import 'package:meals_apps/classes/meals_class.dart';

class MealCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  MealCard(
      {required this.id,
      required this.title,
      required this.affordability,
      required this.duration,
      required this.complexity,
      required this.imageUrl});

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meals_data', arguments: title);
  }

  String getAffordability() {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  String getComplexity() {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(getComplexity()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(getAffordability()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
