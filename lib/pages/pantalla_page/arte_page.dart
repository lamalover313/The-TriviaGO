import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/classes/questionController.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';

class ArtePage extends StatefulWidget {
  const ArtePage({super.key});

  @override
  State<ArtePage> createState() => _ArtePageState();
}

class _ArtePageState extends State<ArtePage> {
  final afprovider = AFProvider();
  final amprovider = AMProvider();
  final ahprovider = AHProvider();

  final QuestionController _controller = Get.put(QuestionController());
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions(difficulty: "easy");
  }

  Future<void> _loadQuestions({required String difficulty}) async {
    try {
      var apiQuestions = <api>[];
      if (difficulty == "easy") {
        apiQuestions = await afprovider.getProductsAsync();
      } else if (difficulty == "medium") {
        apiQuestions = await amprovider.getProductsAsync();
      } else if (difficulty == "hard") {
        apiQuestions = await ahprovider.getProductsAsync();
      }

      final questionList =
          apiQuestions.map((apiQuestion) => apiQuestion.toQuestion()).toList();
          _controller.resetQuestions();
          _controller.questions.assignAll(questionList);
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
      () => context.go('/resultado');
    }
  }

  Widget _buildAnswerButton(
      BuildContext context, String answer, String correctAnswer) {
    return GestureDetector(
      onTap: () {
        _controller.checkAnswer(answer, correctAnswer);
        _nextQuestionOrFinish();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 20,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Arte'),
      backgroundColor: const Color(0xFF0A0E21),
      body: Obx(
        () {
          if (_controller.questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final currentQuestion = _controller.questions[_currentIndex];
          final shuffledOptions = currentQuestion.getShuffledAnswers();

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
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
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orangeAccent, Colors.pinkAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          currentQuestion.question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...shuffledOptions.map(
                          (option) => _buildAnswerButton(
                              context, option, currentQuestion.correctAnswer),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_currentIndex >= _controller.questions.length - 1)
                ElevatedButton(
                  onPressed: () => context.go('/resultado'),
                  child: const Text('Finalizar'),
                ),
            ],
          );
        },
      ),
    );
  }
}
