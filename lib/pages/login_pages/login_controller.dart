import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  static Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      rethrow; 
    }
  }
}