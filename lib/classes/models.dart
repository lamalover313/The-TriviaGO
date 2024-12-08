// ignore: camel_case_types
class api {
  final String difficulty;
  final String question;
  final String correctanswer;
  final List<String> incorrectanswers;

  api({
    required this.difficulty,
    required this.question,
    required this.correctanswer,
    required this.incorrectanswers,
  });

  factory api.fromJson(Map<String, dynamic> json) {
    return api(
      difficulty: json['difficulty'],
      question: json['question'],
      correctanswer: json['correct_answer'],
      incorrectanswers:
          (json['incorrect_answers'] as List).map((e) => e as String).toList(),
    );
  }
}
