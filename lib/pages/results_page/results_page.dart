import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/buttons/boton_resultado.dart';
import 'package:myapp/classes/questionController.dart';
import 'package:get/get.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Section
            Column(
              children: [
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
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(top: 8),
                ),
              ],
            ),
            const Spacer(),
            // Results Section
            Obx(
              () {
                final questionController = Get.find<QuestionController>();
                return Column(
                  children: [
                    _buildResultRow(
                      icon: Icons.check_circle,
                      iconColor: Colors.green,
                      label: 'Respuestas correctas:',
                      value: questionController.correctAnswers.toString(),
                      textColor: Colors.green,
                    ),
                    const SizedBox(height: 20),
                    _buildResultRow(
                      icon: Icons.cancel,
                      iconColor: Colors.red,
                      label: 'Respuestas incorrectas:',
                      value: questionController.incorrectAnswers.toString(),
                      textColor: Colors.red,
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonResultado(
                  icon: Icons.category,
                  text: 'Categorías',
                  color: const Color(0xFFF9A825), // Amber
                  onPressed: () {
                    context.go('/categoria');
                  },
                ),
                BotonResultado(
                  icon: Icons.home,
                  text: 'Home',
                  color: const Color(0xFFEF5350), // Red
                  onPressed: () {
                    context.go('/home');
                  },
                ),
                BotonResultado(
                  icon: Icons.refresh,
                  text: 'Reintentar',
                  color: const Color(0xFF26A69A), // Teal
                  onPressed: () {
                    final questionController = Get.find<QuestionController>();
                    final selectedDifficulty = questionController.selectedDifficulty; // Assume this is set earlier
                    context.go('/categoria?difficulty=$selectedDifficulty');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required Color textColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: iconColor),
        const SizedBox(width: 12),
        Text(
          '$label $value',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}