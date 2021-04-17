// To parse this JSON data, do
//
//     final box = boxFromJson(jsonString);

import 'dart:convert';

Box boxFromJson(String str) => Box.fromJson(json.decode(str));

String boxToJson(Box data) => json.encode(data.toJson());

class Box {
  Box({
    this.id,
    this.medicineId,
    this.amount,
    this.expirationDate,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int medicineId;
  final double amount;
  final String expirationDate;
  final String createdAt;
  final String updatedAt;

  factory Box.fromJson(Map<String, dynamic> json) => Box(
        id: json["id"],
        medicineId: json["medicineId"],
        amount: json["amount"].toDouble(),
        expirationDate: json["expirationDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "medicineId": medicineId,
        "amount": amount,
        "expirationDate": expirationDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
