// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Orders {
  String type;
  num price;
  String vihicleNumber;
  num seats;
  num mobileNumber;
  String id;
  Orders({
    required this.type,
    required this.price,
    required this.vihicleNumber,
    required this.seats,
    required this.mobileNumber,
    required this.id,
  });

  Orders copyWith({
    String? type,
    num? price,
    String? vihicleNumber,
    num? seats,
    num? mobileNumber,
    String? id,
  }) {
    return Orders(
      type: type ?? this.type,
      price: price ?? this.price,
      vihicleNumber: vihicleNumber ?? this.vihicleNumber,
      seats: seats ?? this.seats,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'price': price,
      'vihicleNumber': vihicleNumber,
      'seats': seats,
      'mobileNumber': mobileNumber,
      'id': id,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      type: map['type'] as String,
      price: map['price'] as num,
      vihicleNumber: map['vihicleNumber'] as String,
      seats: map['seats'] as num,
      mobileNumber: map['mobileNumber'] as num,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Orders(type: $type, price: $price, vihicleNumber: $vihicleNumber, seats: $seats, mobileNumber: $mobileNumber, id: $id)';
  }

  @override
  bool operator ==(covariant Orders other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.price == price &&
        other.vihicleNumber == vihicleNumber &&
        other.seats == seats &&
        other.mobileNumber == mobileNumber &&
        other.id == id;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        price.hashCode ^
        vihicleNumber.hashCode ^
        seats.hashCode ^
        mobileNumber.hashCode ^
        id.hashCode;
  }
}
