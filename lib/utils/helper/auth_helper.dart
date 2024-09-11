import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static AuthHelper helper = AuthHelper._();

  AuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  Future<String> signUpEmailWithPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed";
    }
  }

  Future<String> signInEmailWithPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed";
    }
  }

  bool chakeUser() {
    user = auth.currentUser;
    return user != null;

  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  Future<String> signGoolgeWithEmailAndPassword() async {

    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    var cred = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken);
    UserCredential userCred = await auth.signInWithCredential(cred);
    user = userCred.user;
    if (user != null) {
      return "Success";
    } else {
      return "Failed";
    }
  }
}
