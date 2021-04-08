import 'package:calculos_automotivos/controller/engine_rate_controller.dart';
import 'package:calculos_automotivos/helpers/validtor_helper.dart';
import 'package:calculos_automotivos/dialogs/result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculos_automotivos/utils/menu.dart';

class EngineRatePage extends StatefulWidget {
  @override
  _EngineRateState createState() => _EngineRateState();
}

class _EngineRateState extends State<EngineRatePage> {
  final _formkey = GlobalKey<FormState>();
  final _controller = EngineRateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Taxa de Compressão',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Return',
            onPressed: () {
              Navigator.pushNamed(context, '/list_engine');
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
          _buildHeaderText('Informe os Dados do Motor'),
          _buildVerticalSpace(),
          _buildTextInputField(
            'Informe o Nome do Veiculo:',
            onSaved: _controller.setCarName,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Diametro Pistão (milimetros)',
            onSaved: _controller.setEngineDimensions,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Curso Virabrequeim (milimetros)',
            onSaved: _controller.setCrankshaftCourse,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Espeçura Junta (milimetros)',
            onSaved: _controller.setJointerThinckness,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Diametro Junta (milimetros)',
            onSaved: _controller.setJointDiameter,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Volume da Câmara (ml)',
            onSaved: _controller.setChamberVolume,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Volume do pistão (ml)',
            onSaved: _controller.setPistonVolume,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Numero de Pistões',
            onSaved: _controller.setNumberOfPistons,
          ),
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
      final result = _controller.calculateRate();

      showDialog(
        context: context,
        builder: (context) => ResultDialog(result),
      );
    }
  }
}
