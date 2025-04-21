import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScoreService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> saveScore({
    required int correct,
    required int incorrect,
    required int score,
    required bool isRandom,
    String? category,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    final data = {
      'uid': user?.uid ?? '',
      'email': user?.email ?? 'Invitado',
      'correct': correct,
      'incorrect': incorrect,
      'score': score,
      'isRandom': isRandom,
      'category': isRandom ? null : category,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await _firestore.collection('scores').add(data);
  }
}