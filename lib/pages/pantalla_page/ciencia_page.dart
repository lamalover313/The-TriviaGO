import 'package:flutter/material.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:myapp/classes/questionController.dart';

class CienciaPage extends StatefulWidget {
  const CienciaPage({super.key});

  @override
  State<CienciaPage> createState() => _CienciaPageState();
}

class _CienciaPageState extends State<CienciaPage> {
  final ceprovider = CEProvider();
  final cmprovider = CMProvider();
  final chprovider = CHProvider();
  final QuestionController _controller = Get.put(QuestionController());
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions(difficulty: "easy"); // Default difficulty
  }

  Future<void> _loadQuestions({required String difficulty}) async {
    try {
      var apiQuestions = <api>[];
      if (difficulty == "easy") {
        apiQuestions = await ceprovider.getProductsAsync();
      } else if (difficulty == "medium") {
        apiQuestions = await cmprovider.getProductsAsync();
      } else if (difficulty == "hard") {
        apiQuestions = await chprovider.getProductsAsync();
      }

      final questionList =
          apiQuestions.map((apiQuestion) => apiQuestion.toQuestion()).toList();
      _controller.resetQuestions();
      _controller.questions.assignAll(questionList);

      setState(() {
        _currentIndex = 0; // Reset index when loading new questions
      });
    } catch (e) {
      Get.snackbar('Error', 'No se pudieron cargar las preguntas.');
    }
  }

  void _nextQuestionOrFinish() {
    if (_currentIndex < _controller.questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Get.toNamed('/resultados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ciencia'),
      backgroundColor: const Color(0xFF0A0E21),
      body: Obx(
        () {
          if (_controller.questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final currentQuestion = _controller.questions[_currentIndex];
          final shuffledOptions = currentQuestion.getShuffledAnswers();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Barra de progreso y título
                Column(
                  children: [
                    Text(
                      'Pregunta ${_currentIndex + 1}/${_controller.questions.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (_currentIndex + 1) / _controller.questions.length,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.blueAccent),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Pregunta actual
                Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Opciones de respuesta
                ...shuffledOptions.map((option) {
                  return GestureDetector(
                    onTap: () {
                      _controller.checkAnswer(
                          option, currentQuestion.correctAnswer);
                      _nextQuestionOrFinish();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Colors.tealAccent, Colors.cyan],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}