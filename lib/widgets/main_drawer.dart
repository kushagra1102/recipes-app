import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool filtersVisibility = false;
  bool isVegetarian = false;
  bool isVegan = false;
  bool isLactoseFree = false;
  bool isGlucoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.amber,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.indigo),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
          ),
          Container(
            color: Colors.amber[200],
            child: ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: Text(
                'Meals',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.brown),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/tabs');
              },
            ),
          ),
          Container(
            color: Colors.amber[200],
            child: ListTile(
              leading: Icon(
                Icons.settings,
                size: 26,
              ),
              title: Text(
                'Customize',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.brown),
              ),
              onTap: () {
                setState(() {
                  filtersVisibility = true;
                });
              },
            ),
          ),
          Visibility(
            visible: filtersVisibility,
            child: Column(
              children: [
                ListTile(
                  leading: Text('Vegetarian'),
                  trailing: Checkbox(
                    value: isVegetarian,
                    onChanged: (bool? value) {
                      isVegetarian = value!;
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
