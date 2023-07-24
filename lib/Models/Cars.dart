// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cars {
  String path;
  String name;
  String type;
  num seats;
  num price;
  String id;
  Cars({
    required this.path,
    required this.name,
    required this.type,
    required this.seats,
    required this.price,
    required this.id,
  });

  Cars copyWith({
    String? path,
    String? name,
    String? type,
    num? seats,
    num? price,
    String? id,
  }) {
    return Cars(
      path: path ?? this.path,
      name: name ?? this.name,
      type: type ?? this.type,
      seats: seats ?? this.seats,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'name': name,
      'type': type,
      'seats': seats,
      'price': price,
      'id': id,
    };
  }

  factory Cars.fromMap(Map<String, dynamic> map) {
    return Cars(
      path: map['path'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      seats: map['seats'] as num,
      price: map['price'] as num,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cars.fromJson(String source) => Cars.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cars(path: $path, name: $name, type: $type, seats: $seats, price: $price, id: $id)';
  }

  @override
  bool operator ==(covariant Cars other) {
    if (identical(this, other)) return true;
  
    return 
      other.path == path &&
      other.name == name &&
      other.type == type &&
      other.seats == seats &&
      other.price == price &&
      other.id == id;
  }

  @override
  int get hashCode {
    return path.hashCode ^
      name.hashCode ^
      type.hashCode ^
      seats.hashCode ^
      price.hashCode ^
      id.hashCode;
  }
}
