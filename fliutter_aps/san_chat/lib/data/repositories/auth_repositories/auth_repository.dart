import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);

  //metodo para login
  Future<UserCredential?> login(String email, String password);
  Future<void> sigInWithGoogle();
  //metodo para google
  //metodo para Facebook

  //cerrar sesion
  Future<void> logOut();

  //stream para obtener el user logueado
  Stream<User?> get currentUser;
}
