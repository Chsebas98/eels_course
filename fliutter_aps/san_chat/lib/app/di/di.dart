import 'package:get_it/get_it.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';
import 'package:san_chat/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:san_chat/data/repositories/contacts_repository/contacts_repository_impl.dart';
import 'package:san_chat/data/repositories/message_repository/message_repository.dart';
import 'package:san_chat/data/repositories/message_repository/message_repository_impl.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryFirebaseImpl());
  getIt.registerSingleton<ContactsRepository>(ContactsRepositoryImpl());
  getIt.registerSingleton<MessagesRepository>(MessagesRepositoryFirebaseImpl());
}
