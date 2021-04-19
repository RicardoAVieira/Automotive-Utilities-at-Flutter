import 'package:calculos_automotivos/controller/fuel_type_controller.dart';
import 'package:calculos_automotivos/dialogs/fuel_result.dart';
import 'package:calculos_automotivos/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:calculos_automotivos/helpers/validtor_helper.dart';

class MediaConsumo extends StatefulWidget {
  @override
  _MediaConsumoState createState() => _MediaConsumoState();
}

class _MediaConsumoState extends State<MediaConsumo> {
  final _formkey = GlobalKey<FormState>();
  final _controller = FuelTypeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Cadastrar Consumo',
          style: TextStyle(
            fontSize: 14,
            color: Colors.amber,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Return',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
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

  Menu menu = new Menu();

  _buildForm() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderText('Dados do Trajeto'),
          _buildVerticalSpace(),
          _buildTextInputField(
            'Informe o Combustivel:',
            onSaved: _controller.setFuelName,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Preço Combustivel: ',
            onSaved: _controller.setFuelPrice,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Litros Abastecidos: ',
            onSaved: _controller.setFuelLiters,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Km Percorridos: ',
            onSaved: _controller.setKM,
          ),
          _buildVerticalSpace(),
          _buildCalculateButton(),
        ],
      ),
    );
  }

  _buildNumberInputField(String label, {Function(String) onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.amber[600]),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        labelText: label,
      ),
      validator: ValidatorHelper.isValidText,
      keyboardType: TextInputType.number,
    );
  }

  _buildTextInputField(String label, {Function(String) onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.amber[600]),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        labelText: label,
      ),
      validator: ValidatorHelper.isValidText,
      keyboardType: TextInputType.text,
    );
  }

  _buildCalculateButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
      child: const Text(
        'Calcular',
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
      onPressed: _calculate,
    );
  }

  _buildHeaderText(String label) {
    return Container(
      color: Colors.black,
      height: 40,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildVerticalSpace({double height = 20.0}) {
    return SizedBox(
      height: height,
    );
  }

  void _calculate() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      final result = _controller.calculatePrice();

      showDialog(
        context: context,
        builder: (context) => FuelResultDialog(result),
      );
    }
  }
}
