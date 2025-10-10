import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  final String name;
  final String? photo;
  final bool status;

  Contact({required this.name, this.photo, required this.status});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      Contact(name: json["name"], photo: json["photo"], status: json["status"]);

  Map<String, dynamic> toJson() => {
    "name": name,
    "photo": photo,
    "status": status,
  };
}
