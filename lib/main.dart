import 'package:flutter/material.dart';

import './dummy_catogory.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

    void _toggleFavorite(String mealId) {
      final existingIndex = _favoriteMeals.indexWhere(
        (meal) => meal.id == mealId,
      );
      if (existingIndex >= 0) {
        setState(() {
          _favoriteMeals.removeAt(existingIndex);
        });
      } else {
        setState(() {
          _favoriteMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
          );
        });
      }
    }
  

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(245, 245, 245, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 30,
                fontFamily: 'Raleway',
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
              display1: TextStyle(
                fontSize: 19,
                fontFamily: 'RobotoCondensed-bold',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // by default it is
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        '/category-meal': (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
