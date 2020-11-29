import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<auth.User> signInAnonymous() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<auth.User> get firebaseUserStream => _auth.authStateChanges();
}
