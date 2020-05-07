import 'package:flutter/material.dart';

import '../dummy_catogory.dart';
import '../widgets/custom_appbar.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          letterSpacing: 1,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealRouteArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final mealTitle = mealRouteArgs['title'];
    final mealId = mealRouteArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                CustomAppBar('Recipes', false),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    selectedMeal.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                  indent: 170,
                  endIndent: 170,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 25),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: buildSectionTitle(context, 'Ingredients')),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 30, top: 10),
                    width: 300,
                    height: 180,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                      ),
                      itemCount: selectedMeal.ingredients.length,
                    ),
                  ),
                ),
                buildSectionTitle(context, 'Steps'),
                Container(
                  width: double.infinity,
                  height: 400,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${(index + 1)}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'robotoCondensed'),
                      ),
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
           isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
           color: Colors.white,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
