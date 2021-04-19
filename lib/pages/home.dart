import 'package:calculos_automotivos/utils/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();

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
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(20),
          child: _buildForm(),
        ),
      ),
      drawer: menu.buildMenu(context),
    );
  }

  _buildForm() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            width: 280,
            child: Image.asset(
              'lib/assets/img/logo.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black)),
            child: const Text(
              'Calcular Taxa',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            onPressed: () => Navigator.pushNamed(context, '/taxa'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black)),
            child: const Text(
              'Calcular Consumo Medio',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            onPressed: () => Navigator.pushNamed(context, '/consumo'),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }

  Menu menu = new Menu();
}
