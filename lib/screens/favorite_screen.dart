import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 5,
          title: Text(
            'Favorite Meals',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: Center(
          child: Text('You have no favorites yet - start adding some!'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 5,
          title: Text(
            'Favorite Meals',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
