// ignore: camel_case_types
import 'package:myapp/classes/questions.dart';

class api {
  final String difficulty;
  final String question;
  final String correctanswer;
  final String incorrectanswer1;
  final String incorrectanswer2;
  final String incorrectanswer3;

  api({
    required this.difficulty,
    required this.question,
    required this.correctanswer,
    required this.incorrectanswer1,
    required this.incorrectanswer2,
    required this.incorrectanswer3,
  });

  factory api.fromJson(Map<String, dynamic> json) {
    return api(
      difficulty: json['difficulty'],
      question: json['question'],
      correctanswer: json['correct_answer'],
      incorrectanswer1: json['incorrect_answer1'],
      incorrectanswer2: json['incorrect_answer2'],
      incorrectanswer3: json['incorrect_answer3'],
    );
  }

  Question toQuestion() {
    return Question(
      question: question,
      correctAnswer: correctanswer,
      incorrectAnswers: [incorrectanswer1, incorrectanswer2, incorrectanswer3],
    );
  }

}
