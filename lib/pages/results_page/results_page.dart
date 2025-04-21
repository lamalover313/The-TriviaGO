import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/services/score_service.dart';
import 'package:myapp/widgets/buttons/results_button.dart';
import 'package:myapp/classes/triviaController.dart';
import 'package:get/get.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final questionController = Get.find<TriviaController>();
    final correct = questionController.correctAnswers;
    final incorrect = questionController.incorrectAnswers;
    final total = correct + incorrect;
    final score = (correct * 100 ~/ total);

    // Guardar puntuación
    ScoreService.saveScore(
      correct: questionController.correctAnswers,
      incorrect: questionController.incorrectAnswers,
      score: score,
      isRandom: questionController.isRandomMode,
      category: questionController.isRandomMode ? null : questionController.currentCategory,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Fin del Juego',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 3,
              width: 200,
              margin: const EdgeInsets.only(top: 8, bottom: 32),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            _buildStatCard(Icons.emoji_events, 'Puntaje total', '$score%', Colors.amber),
            const SizedBox(height: 20),
            _buildStatCard(Icons.check_circle, 'Respuestas correctas', correct.toString(), Colors.green),
            const SizedBox(height: 20),
            _buildStatCard(Icons.cancel, 'Respuestas incorrectas', incorrect.toString(), Colors.red),
            const Spacer(),
            Wrap(
              spacing: 12,
              alignment: WrapAlignment.center,
              children: [
                BotonResultado(
                  icon: Icons.leaderboard,
                  text: 'Tabla',
                  color: Colors.indigo,
                  onPressed: () => context.go('/leaderboard'),
                ),
                BotonResultado(
                  icon: Icons.category,
                  text: 'Categorías',
                  color: const Color(0xFFF9A825),
                  onPressed: () => context.go('/categoria'),
                ),
                BotonResultado(
                  icon: Icons.home,
                  text: 'Home',
                  color: const Color(0xFFEF5350),
                  onPressed: () => context.go('/home'),
                ),
                BotonResultado(
                  icon: Icons.refresh,
                  text: 'Reintentar',
                  color: const Color(0xFF26A69A),
                  onPressed: () {
                    final selectedDifficulty = questionController.selectedDifficulty;
                    context.go('/categoria?difficulty=$selectedDifficulty');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value, Color color) {
    return Card(
      color: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, color: Colors.white70)),
                Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: color)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}