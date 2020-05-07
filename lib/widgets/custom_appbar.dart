import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';

class CustomAppBar extends StatelessWidget {
  final String pageTitle;
  final bool notHomePage;

  CustomAppBar(this.pageTitle, this.notHomePage);

  void backArrowFunction(BuildContext ctx) {
    Navigator.of(ctx).pop(CupertinoPageRoute(builder: (_) {
      return CategoriesScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              notHomePage == true
                  ? IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      onPressed: () {})
                  : IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                      onPressed: () => backArrowFunction(
                          context), //function to go back to the previous screen
                    ),
              Text(
                pageTitle,
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
