import 'dart:convert';

class InsertDataVihicles {
  String name;
  String vihiclenumber;
  num phoneNumber;
  String type;
  num seats;
  num price;
  String location;
  InsertDataVihicles({
    required this.name,
    required this.vihiclenumber,
    required this.phoneNumber,
    required this.type,
    required this.seats,
    required this.price,
    required this.location,
  });

  InsertDataVihicles copyWith({
    String? name,
    String? vihiclenumber,
    num? phoneNumber,
    String? type,
    num? seats,
    num? price,
    String? location,
  }) {
    return InsertDataVihicles(
      name: name ?? this.name,
      vihiclenumber: vihiclenumber ?? this.vihiclenumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      type: type ?? this.type,
      seats: seats ?? this.seats,
      price: price ?? this.price,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'vihiclenumber': vihiclenumber,
      'phoneNumber': phoneNumber,
      'type': type,
      'seats': seats,
      'price': price,
      'location': location,
    };
  }

  factory InsertDataVihicles.fromMap(Map<String, dynamic> map) {
    return InsertDataVihicles(
      name: map['name'] as String,
      vihiclenumber: map['vihiclenumber'] as String,
      phoneNumber: map['phoneNumber'] as num,
      type: map['type'] as String,
      seats: map['seats'] as num,
      price: map['price'] as num,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InsertDataVihicles.fromJson(String source) =>
      InsertDataVihicles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InsertDataVihicles(name: $name, vihiclenumber: $vihiclenumber, phoneNumber: $phoneNumber, type: $type, seats: $seats, price: $price, location: $location)';
  }

  @override
  bool operator ==(covariant InsertDataVihicles other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.vihiclenumber == vihiclenumber &&
        other.phoneNumber == phoneNumber &&
        other.type == type &&
        other.seats == seats &&
        other.price == price &&
        other.location == location;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        vihiclenumber.hashCode ^
        phoneNumber.hashCode ^
        type.hashCode ^
        seats.hashCode ^
        price.hashCode ^
        location.hashCode;
  }
}
