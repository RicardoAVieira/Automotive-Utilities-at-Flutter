import 'package:utilidades_automotivas/models/fuel_result_model.dart';
import 'package:utilidades_automotivas/utils/menu.dart';
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
          'Lista de Médias de Consumo',
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
          ),
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Add New Car',
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
      body: FutureBuilder<List<FuelResult>>(
        future: DBProvider.db.getAllFuelResult(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FuelResult>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height * 100,
              decoration: BoxDecoration(color: Colors.grey[800]),
              child: ListView.builder(
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
                          height: 10,
                        ),
                        ListTile(
                          tileColor: Colors.grey[300],
                          leading: Text(item.name.toString()),
                          title: Text(
                              "Valor: R\$" + item.amount.toStringAsFixed(2)),
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
              ),
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
