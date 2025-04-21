import 'package:flutter/material.dart';
import 'package:myapp/classes/questions.dart';
import 'package:myapp/widgets/buttons/animated_button.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final List<String> shuffledOptions;
  final Color baseColor1;
  final Color baseColor2;
  final void Function(String selectedAnswer, String correctAnswer) onAnswerSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.shuffledOptions,
    required this.baseColor1,
    required this.baseColor2,
    required this.onAnswerSelected,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? _selectedAnswer; 

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Card(
        key: ValueKey(widget.question.question), 
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.baseColor1, widget.baseColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ...widget.shuffledOptions.map((option) {
                  final isCorrect = option == widget.question.correctAnswer;
                  final isSelected = _selectedAnswer != null && _selectedAnswer == option;

                  Color buttonColor;
                  if (_selectedAnswer == null) {
                    buttonColor = Colors.white.withOpacity(0.9);
                  } else if (isSelected && isCorrect) {
                    buttonColor = Colors.green;
                  } else if (isSelected && !isCorrect) {
                    buttonColor = Colors.red;
                  } else {
                    buttonColor = Colors.white.withOpacity(0.9);
                  }

                  return AnimatedAnswerButton(
                    answer: option,
                    onTap: _selectedAnswer == null
                        ? () {
                            setState(() {
                              _selectedAnswer = option;
                            });
                            Future.delayed(const Duration(milliseconds: 300), () {
                              widget.onAnswerSelected(option, widget.question.correctAnswer);
                            });
                          }
                        : null,
                    color: buttonColor,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}