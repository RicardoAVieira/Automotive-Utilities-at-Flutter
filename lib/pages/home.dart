import 'package:calculos_automotivos/models/engine_dimensions_model.dart';
import 'package:flutter/material.dart';
import '../Database.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List<EngineDimensions> testEngineDimensions = [
    EngineDimensions(
        name: 'fusca',
        diameterOfCylinder: 84.5,
        crankshaftCourse: 86.5,
        chamberVolume: 24.5,
        pistonVolume: 10.5,
        numberOfPistons: 4,
        jointThinckness: 3.10,
        jointDiameter: 85),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculadora Automotiva',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        actions: <Widget>[],
      ),
      body: FutureBuilder<List<EngineDimensions>>(
        future: DBProvider.db.getAllEngineDimensions(),
        builder: (BuildContext context,
            AsyncSnapshot<List<EngineDimensions>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                EngineDimensions item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteEngineDimensions(item.id);
                  },
                  child: ListTile(
                    leading: Text(item.id.toString()),
                    title: Text(item.name.toString()),
                    subtitle: Text(item.diameterOfCylinder.toString()),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: _buildMenu(),
    );
  }

  _buildMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            tileColor: Colors.black,
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
          ListTile(
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
              Navigator.pushNamed(context, '/taxa');
            },
          ),
          ListTile(
            tileColor: Colors.black,
            title: Icon(
              Icons.undo,
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
