import 'dart:convert';

FuelResult fuelResultJson(String str) {
  final jsonData = json.decode(str);
  return FuelResult.fromMap(jsonData);
}

String fuelResultToJson(FuelResult data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class FuelResult {
  int id;
  String name;
  double amount;
  double kmliter;

  FuelResult({
    this.id,
    this.name,
    this.amount,
    this.kmliter,
  });

  factory FuelResult.fromMap(Map<String, dynamic> json) => new FuelResult(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        kmliter: json["kmliter"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "amount": amount,
        "kmliter": kmliter,
      };
}
