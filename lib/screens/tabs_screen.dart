import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals ;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    _pages = [
    CategoriesScreen(),
    FavoriteScreen(widget.favoriteMeals),
  ];
    super.initState();
  }
  List<Widget> _pages;
  int _selectedPageindex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              'Category',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'Favorite',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
