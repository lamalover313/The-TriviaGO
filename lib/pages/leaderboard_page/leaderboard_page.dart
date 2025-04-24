import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:confetti/confetti.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:myapp/widgets/custom/custom_app_bar.dart';
import 'package:myapp/widgets/custom/cutom_background.dart';
import 'package:myapp/pages/leaderboard_page/leaderboard_filter_custom.dart';
import 'package:myapp/pages/leaderboard_page/leaderboard_top3_custom.dart';
import 'package:myapp/pages/leaderboard_page/leaderboard_listitem_custom.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});
  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String? selectedCategory;
  String? selectedMode;
  String? selectedDifficulty;

  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  final confettiController = ConfettiController(duration: const Duration(seconds: 3));

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  Stream<QuerySnapshot> getScoresStream() {
    return FirebaseFirestore.instance
        .collection('scores')
        .orderBy('score', descending: true)
        .snapshots();
  /*
    try {
      CollectionReference scoresRef = FirebaseFirestore.instance.collection('scores');
      Query query = scoresRef.orderBy('score', descending: true);
    
      if (selectedMode != null && selectedMode != 'Todos') {
        query = query.where('mode', isEqualTo: selectedMode);

        if (selectedMode == 'categoria') {
          if (selectedCategory != null && selectedCategory != 'Todos') {
            query = query.where('category', isEqualTo: selectedCategory);
          }
          if (selectedDifficulty != null && selectedDifficulty != 'Todos') {
            query = query.where('difficulty', isEqualTo: selectedDifficulty);
          }
        }
        
      }
      return query.snapshots();
    } catch (e) {
      print('Error en getScoresStream: $e');
      return const Stream.empty();
    }
    */
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: const CustomAppBar(title: 'Tabla de Posiciones', location: '/home'),
      body: Stack(
        children: [
          const Positioned.fill(
            child: DarkenedBackground(imagePath: 'lib/assets/images/Background_01.png'),
          ),
          Column(
            children: [
              /*
              LeaderboardFilter(
                selectedCategory: selectedCategory,
                selectedMode: selectedMode,
                selectedDifficulty: selectedDifficulty,
                onCategoryChanged: (value) {
                  setState(() {
                    selectedCategory = value == 'Todos' ? null : value;
                  });
                },
                onModeChanged: (value) {
                  setState(() {
                    selectedMode = value == 'Todos' ? null : value;
                  });
                },
                onDifficultyChanged: (value) {
                  setState(() {
                    selectedDifficulty = value == 'Todos' ? null : value;
                  });
                },
              ),
              */
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: getScoresStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      print('Firestore error: ${snapshot.error}');
                      return const Center(
                        child: Text('Hubo un error al cargar los datos.', style: TextStyle(color: Colors.white70)),
                      );
                    }

                    final docs = snapshot.data?.docs ?? [];

                    if (docs.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.emoji_events_outlined, color: Colors.white54, size: 64),
                            SizedBox(height: 12),
                            Text("No hay puntuaciones aún.", style: TextStyle(color: Colors.white70, fontSize: 16)),
                          ],
                        ),
                      );
                    }

                    final top3 = docs.take(3).toList();
                    final others = docs.skip(3).toList();

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      confettiController.play();
                    });

                    return Stack(
                      children: [
                        ListView(
                          padding: const EdgeInsets.only(top: 8),
                          children: [
                            Top3Podium(top3: top3),
                            const SizedBox(height: 16),
                            ...others.asMap().entries.map((entry) {
                              final index = entry.key + 4;
                              final data = entry.value.data() as Map<String, dynamic>;
                              final isCurrentUser = data['uid'] == currentUserId;
                              return ListItem(data: data, index: index, isCurrentUser: isCurrentUser);
                            }),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: ConfettiWidget(
                            confettiController: confettiController,
                            blastDirection: -pi / 2,
                            emissionFrequency: 0.1,
                            numberOfParticles: 10,
                            gravity: 0.2,
                            shouldLoop: false,
                            colors: const [Colors.orange, Colors.deepPurple, Colors.amber],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}