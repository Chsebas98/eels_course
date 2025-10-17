// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  final String message;
  final DateTime messageDate;
  final String sentBy;

  Message({
    required this.message,
    required this.messageDate,
    required this.sentBy,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json["message"],
    messageDate: DateTime.parse(json["messageDate"]),
    sentBy: json["sentBy"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messageDate": messageDate,
    "sentBy": sentBy,
  };
}
