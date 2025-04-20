class Question {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final String difficulty;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.difficulty,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
      difficulty: json['difficulty'] as String,
    );
  }

  List<String> getShuffledAnswers() {
    final allAnswers = [...incorrectAnswers, correctAnswer];
    allAnswers.shuffle();
    return allAnswers;
  }
}