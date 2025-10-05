import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository.dart';

class AuthRepositoryFirebaseImpl extends AuthRepository {
  final FirebaseAuth _auth;
  AuthRepositoryFirebaseImpl({FirebaseAuth? auth})
    : _auth = auth ?? FirebaseAuth.instance;
  @override
  Future<void> signUp(String name, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<UserCredential?> login(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
      // throw _mapFirebaseErrorToReadable(e, context: 'login');
    } catch (e) {
      debugPrint('signIn unexpected error: $e');
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseErrorToReadable(e, context: 'signOut');
    } catch (e) {
      debugPrint('signOut unexpected error: $e');
      rethrow;
    }
  }

  Exception _mapFirebaseErrorToReadable(
    FirebaseAuthException e, {
    required String context,
  }) {
    // Centraliza los mensajes legibles para la UI
    final code = e.code;
    switch (code) {
      // Sign In
      case 'invalid-email':
        return Exception('El correo no es válido.');
      case 'user-disabled':
        return Exception('El usuario está deshabilitado.');
      case 'user-not-found':
        return Exception('No existe una cuenta con ese correo.');
      case 'wrong-password':
        return Exception('Contraseña incorrecta.');

      // Sign Up
      case 'email-already-in-use':
        return Exception('El correo ya está registrado.');
      case 'weak-password':
        return Exception('La contraseña es muy débil (mínimo 6 caracteres).');

      // Reset
      case 'missing-email':
        return Exception('Debes ingresar un correo.');

      default:
        return Exception(
          'Error de autenticación ($context): ${e.message ?? code}.',
        );
    }
  }
}
