import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:calculos_automotivos/pages/app_page.dart';
import 'package:calculos_automotivos/pages/home.dart';

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
        '/taxa': (context) => AutomotiveCalculatorPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
