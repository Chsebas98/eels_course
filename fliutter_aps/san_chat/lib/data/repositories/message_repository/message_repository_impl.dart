import 'package:firebase_database/firebase_database.dart';
import 'package:san_chat/data/repositories/message_repository/message_repository.dart';
import 'package:san_chat/domain/models/message.dart';

class MessagesRepositoryFirebaseImpl extends MessagesRepository {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
  ) {
    return _firebaseDatabase.ref('chats').child(chatId).push().set({
      'message': message,
      'messageDate': date,
      'sentBy': sentBy,
    });
  }

  @override
  Stream<List<Message>> getMessages(String chatId) {
    return _firebaseDatabase.ref('chats').child(chatId).onValue.map((event) {
      final value = event.snapshot.value as Map?;
      final messages =
          value?.values.map((element) {
            return Message(
              message: element['message'],
              messageDate: DateTime.parse(element["messageDate"]),
              sentBy: element['sentBy'],
            );
          }).toList() ??
          [];

      return messages..sort((a, b) => a.messageDate.compareTo(b.messageDate));
    });
  }
}
