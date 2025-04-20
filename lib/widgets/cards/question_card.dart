import 'package:flutter/material.dart';
import 'package:myapp/classes/questions.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final List<String> shuffledOptions;
  final Color baseColor1;
  final Color baseColor2;
  final void Function(String selectedAnswer, String correctAnswer)
      onAnswerSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.shuffledOptions,
    required this.baseColor1,
    required this.baseColor2,
    required this.onAnswerSelected,
  });

  Widget _buildAnswerButton(
      BuildContext context, String answer, String correctAnswer) {
    return GestureDetector(
      onTap: () => onAnswerSelected(answer, correctAnswer),
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
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [baseColor1, baseColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.question,
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
                  context,
                  option,
                  question.correctAnswer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
