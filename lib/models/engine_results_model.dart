import 'dart:convert';

EngineResults engineResultsJson(String str) {
  final jsonData = json.decode(str);
  return EngineResults.fromMap(jsonData);
}

String engineResultsToJson(EngineResults data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class EngineResults {
  final int id;
  String name;
  double volumeCylinder;
  double volumeChamber;
  double totalVolume;
  double rateCylinder;
  double volumeEngine;
  double jointVolume;

  EngineResults({
    this.id,
    this.name,
    this.totalVolume = 0.0,
    this.volumeCylinder = 0.0,
    this.rateCylinder = 0.0,
    this.volumeEngine = 0.0,
    this.volumeChamber = 0.0,
    this.jointVolume = 0.0,
  });
  factory EngineResults.fromMap(Map<String, dynamic> json) => new EngineResults(
        id: json["id"],
        name: json["name"],
        totalVolume: json["totalVolume"],
        volumeCylinder: json["volumeCylinder"],
        rateCylinder: json["rateCylinder"],
        volumeEngine: json["volumeEngine"],
        volumeChamber: json["volumeChamber"],
        jointVolume: json["jointVolume"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "totalVolume": totalVolume,
        "volumeCylinder": volumeCylinder,
        "rateCylinder": rateCylinder,
        "volumeEngine": volumeEngine,
        "volumeChamber": volumeChamber,
        "jointVolume": jointVolume,
      };
}
