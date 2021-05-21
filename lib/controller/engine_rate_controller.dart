import 'package:utilidades_automotivas/models/engine_results_model.dart';
import '../helpers/parse_helper.dart';
import '../models/engine_dimensions_model.dart';
import '../Database.dart';

class EngineRateController {
  final engine = new EngineDimensions();

  void setCarName(String value) {
    engine.name = value;
  }

  void setEngineDimensions(String value) {
    engine.diameterOfCylinder = ParseHelper.toDouble(value);
  }

  void setCrankshaftCourse(String value) {
    engine.crankshaftCourse = ParseHelper.toDouble(value);
  }

  void setChamberVolume(String value) {
    engine.chamberVolume = ParseHelper.toDouble(value);
  }

  void setPistonVolume(String value) {
    engine.pistonVolume = ParseHelper.toDouble(value);
  }

  void setNumberOfPistons(String value) {
    engine.numberOfPistons = ParseHelper.toDouble(value);
  }

  void setJointerThinckness(String value) {
    engine.jointThinckness = ParseHelper.toDouble(value);
  }

  void setJointDiameter(String value) {
    engine.jointDiameter = ParseHelper.toDouble(value);
  }

  EngineResults calculateRate() {
    final result = new EngineResults();
    result.volumeCylinder = ((engine.diameterOfCylinder *
            engine.diameterOfCylinder *
            engine.crankshaftCourse *
            engine.pi) /
        4000);

    result.jointVolume = ((engine.jointDiameter *
            engine.jointDiameter *
            engine.jointThinckness *
            engine.pi) /
        4000);

    result.volumeChamber =
        engine.chamberVolume + engine.pistonVolume + result.jointVolume;

    result.totalVolume = (result.volumeCylinder + result.volumeChamber);

    result.rateCylinder =
        ((result.volumeCylinder + result.volumeChamber) / result.volumeChamber);

    result.volumeEngine = (result.volumeCylinder * engine.numberOfPistons);
    result.name = engine.name;

    DBProvider.db.newEngineDimensions(engine);
    DBProvider.db.newEngineResults(result);

    return result;
  }
}
