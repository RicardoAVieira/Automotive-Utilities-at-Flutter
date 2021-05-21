import '../models/engine_results_model.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final EngineResults result;

  ResultDialog(this.result);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'Cilindrada do Cilindro: ${result.volumeCylinder.toStringAsFixed(2)} cm³',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Cilindrada do Motor: ${result.volumeEngine.toStringAsFixed(2)} cm³',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Compressão: ${result.rateCylinder.toStringAsFixed(2)} /1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[900],
              ),
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.amber),
              ),
              onPressed: () => Navigator.pushNamed(context, '/list_engine'),
            ),
          ],
        ),
      ),
    );
  }
}
