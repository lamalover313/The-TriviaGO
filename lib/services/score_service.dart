import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScoreService {
  static final _firestore = FirebaseFirestore.instance;

    static Future<void> saveScore({
    required int correct,
    required int incorrect,
    required int score,
    required bool isRandom,
    required String difficulty, 
    required String category,  
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    final data = {
      'uid': user?.uid ?? '',
      'email': user?.email ?? 'Invitado',
      'username': user?.displayName ?? '', 
      'correct': correct,
      'incorrect': incorrect,
      'score': score,
      'mode': isRandom ? 'random' : 'categoria',
      'category': category,
      'difficulty': difficulty,
      'timestamp': FieldValue.serverTimestamp(),
    };
    await _firestore.collection('scores').add(data);
  }
}