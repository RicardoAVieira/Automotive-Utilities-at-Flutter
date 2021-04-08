import 'dart:convert';

FuelType fuelType(String str) {
  final jsonData = json.decode(str);
  return FuelType.fromMap(jsonData);
}

String fuelTypeToJson(FuelType data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class FuelType {
  int id;
  String name;
  double km;
  double liters;
  double price;

  FuelType({
    this.id,
    this.name = "",
    this.km = 0.0,
    this.liters = 0.0,
    this.price = 0.0,
  });
  factory FuelType.fromMap(Map<String, dynamic> json) => new FuelType(
        id: json["id"],
        name: json["name"],
        km: json["km"],
        liters: json["liters"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "km": km,
        "liters": liters,
        "price": price,
      };
}
