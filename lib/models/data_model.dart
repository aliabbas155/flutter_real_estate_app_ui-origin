// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class cars {
  int Price;
  String Engine;
  int Model;
  String HorsePower;
  int kitchen;
  String Car;
  String Mileage;
  int id;
  cars({
    required this.Price,
    required this.Engine,
    required this.Model,
    required this.HorsePower,
    required this.kitchen,
    required this.Car,
    required this.Mileage,
    required this.id,
  });

  cars copyWith({
    int? Price,
    String? Engine,
    int? Model,
    String? HorsePower,
    int? kitchen,
    String? Car,
    String? Mileage,
    int? id,
  }) {
    return cars(
      Price: Price ?? this.Price,
      Engine: Engine ?? this.Engine,
      Model: Model ?? this.Model,
      HorsePower: HorsePower ?? this.HorsePower,
      kitchen: kitchen ?? this.kitchen,
      Car: Car ?? this.Car,
      Mileage: Mileage ?? this.Mileage,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Price': Price,
      'Engine': Engine,
      'Model': Model,
      'HorsePower': HorsePower,
      'kitchen': kitchen,
      'Car': Car,
      'Mileage': Mileage,
      'id': id,
    };
  }

  factory cars.fromMap(Map<String, dynamic> map) {
    return cars(
      Price: map['Price'] as int,
      Engine: map['Engine'] as String,
      Model: map['Model'] as int,
      HorsePower: map['HorsePower'] as String,
      kitchen: map['kitchen'] as int,
      Car: map['Car'] as String,
      Mileage: map['Mileage'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory cars.fromJson(String source) => cars.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'cars(Price: $Price, Engine: $Engine, Model: $Model, HorsePower: $HorsePower, kitchen: $kitchen, Car: $Car, Mileage: $Mileage, id: $id)';
  }

  @override
  bool operator ==(covariant cars other) {
    if (identical(this, other)) return true;
  
    return 
      other.Price == Price &&
      other.Engine == Engine &&
      other.Model == Model &&
      other.HorsePower == HorsePower &&
      other.kitchen == kitchen &&
      other.Car == Car &&
      other.Mileage == Mileage &&
      other.id == id;
  }

  @override
  int get hashCode {
    return Price.hashCode ^
      Engine.hashCode ^
      Model.hashCode ^
      HorsePower.hashCode ^
      kitchen.hashCode ^
      Car.hashCode ^
      Mileage.hashCode ^
      id.hashCode;
  }
}
//  class cars {
//   cars({
//     this.id,
//     this.Price,
//     this.Car,
//     this.Engine,
//     this.Model,
//     this.Mileage,
//     this.HorsePower,
//     this.kitchen,
//   });

//   int Price;
//   String Engine;
//   int Model;
//   String HorsePower;
//   int kitchen;
//   String Car;
//   String Mileage;
//   int id;
// }
