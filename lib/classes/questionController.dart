import 'package:get/get.dart';
import 'package:myapp/classes/questions.dart';
import 'package:myapp/classes/providerQuestion.dart';

class QuestionController extends GetxController {
  final _questions = <Question>[].obs;
  final _correctAnswers = 0.obs;
  final _incorrectAnswers = 0.obs;

  List<Question> get questions => _questions;
  int get correctAnswers => _correctAnswers.value;
  int get incorrectAnswers => _incorrectAnswers.value;

  Future<void> fetchQuestions(String category, String difficulty) async {
    try {
      final fetchedQuestions = await QuestionProvider().fetchQuestions(category, difficulty);
      _questions.assignAll(fetchedQuestions);
      resetScores();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load questions: $e');
    }
  }

  void checkAnswer(String selectedAnswer, String correctAnswer) {
    if (selectedAnswer == correctAnswer) {
      _correctAnswers.value++;
    } else {
      _incorrectAnswers.value++;
    }
  }

  void resetScores() {
    _correctAnswers.value = 0;
    _incorrectAnswers.value = 0;
  }

  void resetQuestions() {
    _questions.clear();
  }
}