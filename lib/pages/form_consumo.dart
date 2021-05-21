import 'package:utilidades_automotivas/controller/fuel_type_controller.dart';
import 'package:utilidades_automotivas/dialogs/fuel_result.dart';
import 'package:utilidades_automotivas/utils/menu.dart';
import 'package:flutter/material.dart';
import 'package:utilidades_automotivas/helpers/validtor_helper.dart';

class MediaConsumo extends StatefulWidget {
  @override
  _MediaConsumoState createState() => _MediaConsumoState();
}

class _MediaConsumoState extends State<MediaConsumo> {
  final _formkey = GlobalKey<FormState>();
  final _controller = FuelTypeController();
  String dropdownValue = 'Gasolina';

  @override
  Widget build(BuildContext context) {
    final havaliabeHeight = MediaQuery.of(context).size.height;

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
            icon: const Icon(Icons.list),
            tooltip: 'Ver Lista de Consumos Anteriores',
            onPressed: () {
              Navigator.pushNamed(context, '/list_fuel');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
            tooltip: 'Voltar para Menu inicial',
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
      body: Container(
        color: Colors.black87,
        height: havaliabeHeight,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
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
          _buildNumberInputField(
            'Preço Combustível: ',
            onSaved: _controller.setFuelPrice,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Litros Abastecidos: ',
            onSaved: _controller.setFuelLiters,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Quilômetros Percorridos: ',
            onSaved: _controller.setKM,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          _buildSelectField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          _buildCalculateButton(),
        ],
      ),
    );
  }

  _buildSelectField() {
    return DropdownButton<String>(
      dropdownColor: Colors.grey[700],
      focusColor: Colors.grey[400],
      value: dropdownValue,
      icon: Center(
        child: const Icon(
          Icons.arrow_downward,
        ),
      ),
      iconSize: 24,
      elevation: 26,
      style: TextStyle(
        color: Colors.white,
      ),
      underline: Container(
        height: 2,
        color: Colors.grey[700],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          _controller.setFuelName(dropdownValue);
        });
      },
      items: <String>[
        'Gasolina',
        'Álcool',
        'Diesel',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  _buildNumberInputField(String label, {Function(String) onSaved}) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.amber[200]),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey[700]),
        ),
        labelStyle: TextStyle(
          color: Colors.grey[400],
        ),
        labelText: label,
      ),
      validator: ValidatorHelper.isValidText,
      keyboardType: TextInputType.number,
    );
  }

  _buildCalculateButton() {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        child: const Text(
          'Calcular',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        onPressed: _calculate,
      ),
    );
  }

  _buildHeaderText(String label) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * .10,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18 * MediaQuery.of(context).textScaleFactor,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildVerticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.015,
    );
  }

  void _calculate() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      _validaCombustivel() {
        if (_controller.fuel.name == null || _controller.fuel.name == '') {
          _controller.fuel.name = 'Gasolina';
          final result = _controller.calculatePrice();
          return result;
        } else {
          final result = _controller.calculatePrice();
          return result;
        }
      }

      final result = _validaCombustivel();

      showDialog(
        context: context,
        builder: (context) => FuelResultDialog(result),
      );
    }
  }
}
