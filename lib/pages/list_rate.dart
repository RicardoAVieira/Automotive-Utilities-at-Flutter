import 'package:calculos_automotivos/models/engine_results_model.dart';
import 'package:calculos_automotivos/utils/menu.dart';
import 'package:flutter/material.dart';
import '../Database.dart';

class ListEngineRate extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ListEngineRate> {
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
      drawer: menu.buildMenu(context),
    );
  }

  Menu menu = new Menu();
}
