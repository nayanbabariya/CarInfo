import 'dart:convert';

List<Car> carFromJson(String str) =>
    List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

class Car {
  Car({
    this.id = 0,
    this.vehicleName = '',
    this.modelName = '',
    this.age = '',
    this.image = '',
  });

  final int id;
  final String vehicleName;
  final String modelName;
  final String age;
  final String image;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        vehicleName: json["vehicle_name"],
        modelName: json["model_name"],
        age: json["age"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicle_name": vehicleName,
        "model_name": modelName,
        "age": age,
        "image": image,
      };
}
