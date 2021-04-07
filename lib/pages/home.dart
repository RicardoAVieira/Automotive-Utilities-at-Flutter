import 'package:calculos_automotivos/models/engine_results_model.dart';
import 'package:flutter/material.dart';
import '../Database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculadora Automotiva',
          style: TextStyle(
            fontSize: 15,
            color: Colors.amber,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add New Car',
            onPressed: () {
              Navigator.pushNamed(context, '/taxa');
            },
          )
        ],
      ),
      body: FutureBuilder<List<EngineResults>>(
        future: DBProvider.db.getAllEngineResults(),
        builder: (BuildContext context,
            AsyncSnapshot<List<EngineResults>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                EngineResults item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteEngineResults(item.id);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      ListTile(
                        tileColor: Colors.grey[300],
                        leading: Text(item.name.toString()),
                        title: Text(
                            "Taxa: " + item.rateCylinder.toStringAsFixed(2)),
                        subtitle: Text("Cilindrada Motor: " +
                            item.volumeEngine.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete carr',
                          onPressed: () {
                            DBProvider.db.deleteEngineResults(item.id);
                            setState(() {});
                          },
                        ),
                        onTap: () {},
                      ),
                    ],
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
              Navigator.pushNamed(context, '/taxa');
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
