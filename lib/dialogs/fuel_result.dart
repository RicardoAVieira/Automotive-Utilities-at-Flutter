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
                'Nome do Combustivel: ${result.name} ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Valor Toral da Abastecida: R\$${result.amount.toStringAsFixed(2)} ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'KM/Litro: ${result.kmliter.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Fechar'),
              onPressed: () => Navigator.pushNamed(context, '/list_fuel'),
            ),
          ],
        ),
      ),
    );
  }
}
