import 'package:firebase_auth/firebase_auth.dart';
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
              id: element['id'],
              name: element['name'],
              photo: element['photo'],
              status: element['status'],
            );
          }).toList() ??
          [];
    });
  }

  @override
  Future<void> updateUserStatus(User user, bool status) {
    return _firebaseDatabes.ref('users').child(user.uid).update({
      'name': user.displayName,
      'status': status,
      'photo': user.photoURL,
      'userId': user.uid,
    });
  }
}
