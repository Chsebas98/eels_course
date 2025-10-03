import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository.dart';

class AuthRepositoryFirebaseImpl extends AuthRepository {
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
}
