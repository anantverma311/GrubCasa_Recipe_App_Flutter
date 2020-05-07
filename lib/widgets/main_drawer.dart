import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget builListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontFamily: 'raleway', fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.amber.withOpacity(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'raleway',
                  ),
                ),
                Text(
                  'to GrubCasa',
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          builListTile(
            'Categories',
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            }
          ),
          builListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}
