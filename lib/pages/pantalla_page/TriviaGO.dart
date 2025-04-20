import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/triviaController.dart';
import 'package:myapp/widgets/cards/question_card.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';

class TriviaGO extends StatefulWidget {
  final String apiUrl;
  final String category;
  final String difficulty;
  final Color baseColor1;
  final Color baseColor2;

  const TriviaGO({
    super.key,
    required this.category,
    required this.difficulty,
    required this.baseColor1,
    required this.baseColor2,
    required this.apiUrl,
  });

  @override
  State<TriviaGO> createState() => _TriviaGOState();
}

class _TriviaGOState extends State<TriviaGO> {
  final TriviaController _controller = Get.put(TriviaController());
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.setRandomMode(false);
    _controller.setCategory(widget.category);
    _controller.fetchQuestionsFromUrl(widget.apiUrl, widget.difficulty);
  }

  void _nextQuestionOrFinish() {
    if (_currentIndex < _controller.questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      context.go('/resultado');
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
      appBar: CustomAppBar(title: widget.category),
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
              QuestionCard(
                question: currentQuestion,
                shuffledOptions: shuffledOptions,
                baseColor1: widget.baseColor1,
                baseColor2: widget.baseColor2,
                onAnswerSelected: (selected, correct) {
                  _controller.checkAnswer(selected, correct);
                  _nextQuestionOrFinish();
                },
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
