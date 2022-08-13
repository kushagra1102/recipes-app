enum Affordability { Affordable, Pricey, Luxurious }
enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {required this.title,
      required this.categories,
      required this.id,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.ingredients,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.steps});
}
