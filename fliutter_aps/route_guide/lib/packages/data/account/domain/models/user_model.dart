import 'dart:convert';

class UserModel {
  final String name;
  final int age;
  final double weight;
  final String email;

  UserModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'weight': weight,
    'email': email,
  };

  @override
  String toString() => jsonEncode(toJson());
}
