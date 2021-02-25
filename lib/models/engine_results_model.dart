class EngineResultsModel {
  double volumeCylinder;
  double volumeChamber;
  double totalVolume;
  double rateCylinder;
  double volumeEngine;
  double jointVolume;

  EngineResultsModel({
    this.totalVolume = 0.0,
    this.volumeCylinder = 0.0,
    this.rateCylinder = 0.0,
    this.volumeEngine = 0.0,
    this.volumeChamber = 0.0,
    this.jointVolume = 0.0,
  });
}
