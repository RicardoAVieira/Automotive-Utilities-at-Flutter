import 'package:calculos_automotivos/pages/list_consumo.dart';
import 'package:calculos_automotivos/pages/list_rate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:calculos_automotivos/pages/form_rate.dart';
import 'package:calculos_automotivos/pages/home.dart';
import 'package:calculos_automotivos/pages/media_consumo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      title: 'Calculadora Automotiva',
      initialRoute: '/',
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
