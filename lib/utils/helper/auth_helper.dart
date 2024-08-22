import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static AuthHelper helper = AuthHelper._();

  AuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUpEmailWithPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed";
    }
  }

  Future<String> signInEmailWithPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed";
    }
  }
}
