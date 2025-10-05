import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);

  //metodo para login
  Future<UserCredential?> login(String email, String password);
  //metodo para google
  //metodo para Facebook

  //cerrar sesion
  Future<void> logOut();
}
