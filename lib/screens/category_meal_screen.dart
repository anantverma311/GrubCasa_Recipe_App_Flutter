import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../widgets/custom_appbar.dart';

class CategoryMealScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryId, this.categoryTitle);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppBar(categoryTitle, false),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageUrl: categoryMeals[index].imageUrl,
                    complexity: categoryMeals[index].complexity,
                    affordability: categoryMeals[index].affordability,
                    duration: categoryMeals[index].duration,
                  );
                },
                itemCount: categoryMeals.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
