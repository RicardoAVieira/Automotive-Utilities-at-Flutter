import 'package:flutter/material.dart';

class Menu {
  buildMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[900]),
            child: DrawerHeader(
              child: Text(
                'Utilidades Automotivas',
                style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.amber,
                  fontSize: 30 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey[900]),
            height: MediaQuery.of(context).size.height * 0.90,
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.black,
                  title: Text(
                    'Início',
                    style: TextStyle(
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
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
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ListTile(
                  tileColor: Colors.black,
                  title: Text(
                    'Taxa de Compressão',
                    style: TextStyle(
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                      color: Colors.amber,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pushNamed(context, '/taxa');
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ListTile(
                  tileColor: Colors.black,
                  title: Text(
                    'Quilômetros Por Litro',
                    style: TextStyle(
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                      color: Colors.amber,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pushNamed(context, '/consumo');
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.245,
                ),
                ListTile(
                  tileColor: Colors.black,
                  contentPadding: EdgeInsets.all(
                    MediaQuery.of(context).size.height * 0.10,
                  ),
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
          ),
        ],
      ),
    );
  }
}
