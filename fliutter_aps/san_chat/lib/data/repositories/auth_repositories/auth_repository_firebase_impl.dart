import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository.dart';

class AuthRepositoryFirebaseImpl extends AuthRepository {
  final FirebaseAuth _auth;
  AuthRepositoryFirebaseImpl({FirebaseAuth? auth})
    : _auth = auth ?? FirebaseAuth.instance;
  @override
  Future<void> signUp(String name, String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential?> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  @override
  Future<void> sigInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Stream<User?> get currentUser => FirebaseAuth.instance.authStateChanges();

  @override
  Future<void> logOut() {
    return Future.wait([GoogleSignIn.instance.signOut(), _auth.signOut()]);
  }

  @override
  Future<User?> get user => currentUser.first;
}
