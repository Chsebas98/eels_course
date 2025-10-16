import 'package:firebase_auth/firebase_auth.dart';
import 'package:san_chat/data/domain/models/contact_model.dart';

abstract class ContactsRepository {
  //Obtener
  Stream<List<Contact>> getUsers();

  Future<void> updateUserStatus(User user, bool status);
}
