import 'package:flutter/material.dart';
import 'package:meals_apps/screens/category_screen.dart';
import 'package:meals_apps/screens/favourites_screen.dart';
import 'package:meals_apps/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text('DeliMeals'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.indigoAccent,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavouritesScreen(),
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
