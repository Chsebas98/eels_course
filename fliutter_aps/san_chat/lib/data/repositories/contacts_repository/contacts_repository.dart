import 'package:san_chat/data/domain/models/contact_model.dart';

abstract class ContactsRepository {
  //Obtener
  Stream<List<Contact>> getUsers();
}
