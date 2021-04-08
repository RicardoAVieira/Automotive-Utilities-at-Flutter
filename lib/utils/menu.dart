import 'package:flutter/material.dart';

class Menu {
  buildMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Calculadora Automotiva',
              style: TextStyle(
                letterSpacing: 5,
                color: Colors.amber,
                fontSize: 24,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            tileColor: Colors.black,
            contentPadding: EdgeInsets.all(5),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/');
            },
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(5),
            tileColor: Colors.black,
            title: Text(
              'Taxa de Compressão',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/list_engine');
            },
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(5),
            tileColor: Colors.black,
            title: Text(
              'Km Por Litro',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/list_fuel');
            },
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            tileColor: Colors.black,
            contentPadding: EdgeInsets.all(5),
            title: Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
