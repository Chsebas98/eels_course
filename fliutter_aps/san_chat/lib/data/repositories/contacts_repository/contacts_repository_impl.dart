import 'package:firebase_database/firebase_database.dart';
import 'package:san_chat/data/domain/models/contact_model.dart';
import 'package:san_chat/data/repositories/contacts_repository/contacts_repository.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final _firebaseDatabes = FirebaseDatabase.instance;
  @override
  Stream<List<Contact>> getUsers() {
    return _firebaseDatabes.ref('users').onValue.map((event) {
      final value = event.snapshot.value as Map?;

      return value?.values.map((element) {
            return Contact(
              name: element['name'],
              photo: element['photo'],
              status: element['status'],
            );
          }).toList() ??
          [];
    });
  }
}
