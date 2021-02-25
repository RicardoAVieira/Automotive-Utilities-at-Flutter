import 'package:calculos_automotivos/pages/app_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      title: 'Taxa de Compressão',
      home: AutomotiveCalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
