import 'package:utilidades_automotivas/pages/list_consumo.dart';
import 'package:utilidades_automotivas/pages/list_rate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:utilidades_automotivas/pages/form_rate.dart';
import 'package:utilidades_automotivas/pages/home.dart';
import 'package:utilidades_automotivas/pages/form_consumo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilidades Automotiva',
      initialRoute: '/',
      theme:
          ThemeData(primaryColor: Colors.grey[900], accentColor: Colors.amber),
      routes: {
        '/': (context) => HomePage(),
        '/list_engine': (context) => ListEngineRate(),
        '/taxa': (context) => EngineRatePage(),
        '/list_fuel': (context) => FuelList(),
        '/consumo': (context) => MediaConsumo(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
