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
          Text('Seja bem vindo !!!'),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
            child: const Text('Calcular Taxa'),
            onPressed: () => Navigator.pushNamed(context, '/taxa'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: const Text('Calcular Consumo Medio'),
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
