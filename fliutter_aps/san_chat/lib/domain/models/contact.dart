// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  final String name;
  final String? photoUrl;
  final bool status;
  final String id;

  Contact({
    required this.name,
    this.photoUrl,
    required this.status,
    required this.id,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    name: json["name"],
    photoUrl: json["photoUrl"],
    status: json["status"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photoUrl": photoUrl,
    "status": status,
    "id": id,
  };

  String get statusDetail => status ? 'Online' : 'Offline';

  /// Returns the color status. If [true] return green, in other case returns red
  Color get statusColor => status ? Colors.green : Colors.red;
}
