import 'package:utilidades_automotivas/utils/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final havaliabeHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Utilidades Automotivas',
          style: TextStyle(
            fontSize: 15,
            color: Colors.amber,
          ),
        ),
        actions: <Widget>[],
      ),
      body: Container(
        height: havaliabeHeight,
        color: Colors.grey[900],
        padding: const EdgeInsets.all(05),
        child: _buildForm(),
      ),
      drawer: menu.buildMenu(context),
    );
  }

  _buildForm() {
    return Form(
      key: _formkey,
      child: Container(
        decoration: new BoxDecoration(color: Colors.grey[900]),
        height: MediaQuery.of(context).size.height * 0.82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Image.asset(
                'lib/assets/img/logo.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: const Text(
                'Calcular Taxa de Compressão',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/taxa'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: const Text(
                'Calcular Consumo Médio',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/consumo'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: const Text(
                'Lista de Taxas de Compressão',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/list_engine'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child: const Text(
                'Lista de Médias de Consumo',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/list_fuel'),
            ),
          ],
        ),
      ),
    );
  }

  Menu menu = new Menu();
}
