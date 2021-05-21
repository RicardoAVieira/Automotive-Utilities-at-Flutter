import 'package:utilidades_automotivas/models/fuel_result_model.dart';
import 'package:utilidades_automotivas/models/fuel_type_model.dart';
import '../helpers/parse_helper.dart';

import '../Database.dart';

class FuelTypeController {
  final fuel = new FuelType();

  void setFuelName(String value) {
    fuel.name = value;
  }

  void setFuelLiters(String value) {
    fuel.liters = ParseHelper.toDouble(value);
  }

  void setKM(String value) {
    fuel.km = ParseHelper.toDouble(value);
  }

  void setFuelPrice(String value) {
    fuel.price = ParseHelper.toDouble(value);
  }

  FuelResult calculatePrice() {
    final result = new FuelResult();
    result.amount = (fuel.price * fuel.liters);
    result.kmliter = (fuel.km / fuel.liters);

    result.name = fuel.name;

    DBProvider.db.newFuelType(fuel);
    DBProvider.db.newFuelResult(result);

    return result;
  }
}
