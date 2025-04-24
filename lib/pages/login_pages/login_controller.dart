import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<User?> signInWithUsernameOrEmail(String input, String password) async {
    try {
      String email = input.contains('@') ? input : await _getEmailFromUsername(input);

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e, isLogin: true);
    } catch (_) {
      throw Exception('Error inesperado. Intenta de nuevo.');
    }
  }

  static Future<User?> createUserWithEmailPassword(
      String username, String email, String password) async {
    try {
      final existing = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .limit(1)
          .get();

      if (existing.docs.isNotEmpty) {
        throw Exception('El nombre de usuario ya está en uso.');
      }

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
      });

      await userCredential.user!.updateDisplayName(username);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    } catch (_) {
      throw Exception('Error inesperado. Intenta nuevamente.');
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // 🔁 Reutilización
  static Future<String> _getEmailFromUsername(String username) async {
    final query = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    if (query.docs.isEmpty) throw Exception('Usuario no encontrado.');
    return query.docs.first['email'];
  }

  static Exception _handleAuthError(FirebaseAuthException e, {bool isLogin = false}) {
    switch (e.code) {
      case 'wrong-password':
        return Exception('Contraseña incorrecta.');
      case 'user-not-found':
        return Exception('Usuario o correo no encontrado.');
      case 'email-already-in-use':
        return Exception('Este correo ya está registrado.');
      case 'invalid-email':
        return Exception('Correo electrónico inválido.');
      case 'weak-password':
        return Exception('La contraseña es muy débil.');
      case 'network-request-failed':
        return Exception('Sin conexión a internet.');
      default:
        return Exception(e.message ?? (isLogin ? 'Error desconocido al iniciar sesión.' : 'Error al crear la cuenta.'));
    }
  }
}