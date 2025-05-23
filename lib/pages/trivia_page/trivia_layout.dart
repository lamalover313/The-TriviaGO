import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/triviaController.dart';
import 'package:myapp/widgets/cards/question_card.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';
import 'package:myapp/widgets/custom/cutom_background.dart';

class TriviaLayout extends StatefulWidget {
  final String title;
  final String location;
  final Color baseColor1;
  final Color baseColor2;
  final VoidCallback onInit;

  const TriviaLayout({
    super.key,
    required this.title,
    required this.location,
    required this.baseColor1,
    required this.baseColor2,
    required this.onInit,
  });

  @override
  State<TriviaLayout> createState() => _TriviaLayoutState();
}

class _TriviaLayoutState extends State<TriviaLayout> {
  final TriviaController _controller = Get.put(TriviaController());
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.onInit();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        location: widget.location
        ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Stack(
        children: [
          const DarkenedBackground(
            imagePath: 'lib/assets/images/Background_01.png',
          ),
          Obx(() {
            if (_controller.questions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final question = _controller.questions[_currentIndex];
            final options = question.getShuffledAnswers();

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
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                        CurvedAnimation(parent: animation, curve: Curves.easeOut),
                      ),
                      child: child,
                    ),
                  ),
                  child: QuestionCard(
                    key: ValueKey(_currentIndex),
                    question: question,
                    shuffledOptions: options,
                    baseColor1: widget.baseColor1,
                    baseColor2: widget.baseColor2,
                    onAnswerSelected: (selected, correct) {
                      _controller.checkAnswer(selected, correct);
                      Future.delayed(const Duration(milliseconds: 500), _nextQuestionOrFinish);
                    },
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}