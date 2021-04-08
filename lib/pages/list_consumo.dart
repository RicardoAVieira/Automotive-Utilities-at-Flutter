import 'package:calculos_automotivos/models/fuel_result_model.dart';
import 'package:calculos_automotivos/utils/menu.dart';
import 'package:flutter/material.dart';
import '../Database.dart';

class FuelList extends StatefulWidget {
  @override
  _FuelList createState() => _FuelList();
}

class _FuelList extends State<FuelList> {
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
              Navigator.pushNamed(context, '/consumo');
            },
          )
        ],
      ),
      body: FutureBuilder<List<FuelResult>>(
        future: DBProvider.db.getAllFuelResult(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FuelResult>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                FuelResult item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteFuelResult(item.id);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      ListTile(
                        tileColor: Colors.grey[300],
                        leading: Text(item.name.toString()),
                        title:
                            Text("Valor: R\$" + item.amount.toStringAsFixed(2)),
                        subtitle: Text(
                            "Km/Litros: " + item.kmliter.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete carr',
                          onPressed: () {
                            DBProvider.db.deleteFuelResult(item.id);
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
