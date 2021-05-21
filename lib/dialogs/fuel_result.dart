import '../models/fuel_result_model.dart';
import 'package:flutter/material.dart';

class FuelResultDialog extends StatelessWidget {
  final FuelResult result;

  FuelResultDialog(this.result);

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
                'Nome do Combustível: ${result.name} ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Valor total do Abastecimento: R\$${result.amount.toStringAsFixed(2)} ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Quilômetros por Litro: ${result.kmliter.toStringAsFixed(2)}',
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
              onPressed: () => Navigator.pushNamed(context, '/list_fuel'),
            ),
          ],
        ),
      ),
    );
  }
}
