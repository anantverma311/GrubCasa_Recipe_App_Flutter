import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../dummy_catogory.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 5,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            'GrubCasa',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // CustomAppBar(
            //     'GrubCasa', true), // top custom made appbar which is used
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                children: DUMMY_CATEGORIES
                    .map((catData) => CategoryItem(
                          catData.id,
                          catData.title,
                          catData.color,
                        ))
                    .toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
