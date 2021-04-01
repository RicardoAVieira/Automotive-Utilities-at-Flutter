import 'dart:convert';

EngineDimensions engineDimensionsJson(String str) {
  final jsonData = json.decode(str);
  return EngineDimensions.fromMap(jsonData);
}

String engineDimensionsToJson(EngineDimensions data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class EngineDimensions {
  int id;
  String name;
  double diameterOfCylinder;
  double crankshaftCourse;
  double chamberVolume;
  double pistonVolume;
  double numberOfPistons;
  double jointThinckness;
  double jointDiameter;
  final double pi = 3.1415;

  EngineDimensions({
    this.id,
    this.name,
    this.diameterOfCylinder = 0.0,
    this.crankshaftCourse = 0.0,
    this.chamberVolume = 0.0,
    this.pistonVolume = 0.0,
    this.numberOfPistons = 0.0,
    this.jointThinckness = 0.0,
    this.jointDiameter = 0.0,
  });
  factory EngineDimensions.fromMap(Map<String, dynamic> json) =>
      new EngineDimensions(
        id: json["id"],
        name: json["name"],
        diameterOfCylinder: json["diameterOfCylinder"],
        crankshaftCourse: json["crankshaftCourse"],
        chamberVolume: json["chamberVolume"],
        pistonVolume: json["pistonVolume"],
        numberOfPistons: json["numberOfPistons"],
        jointThinckness: json["jointThinckness"],
        jointDiameter: json["jointDiameter"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "diameterOfCylinder": diameterOfCylinder,
        "crankshaftCourse": crankshaftCourse,
        "chamberVolume": chamberVolume,
        "pistonVolume": pistonVolume,
        "numberOfPistons": numberOfPistons,
        "jointThinckness": jointThinckness,
        "jointDiameter": jointDiameter,
      };
}
