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

  // Fetch questions
  Future<void> fetchQuestions(String category, String difficulty) async {
    try {
      final fetchedQuestions = await QuestionService.fetchQuestions(category, difficulty);
      _questions.assignAll(fetchedQuestions);
      resetScores();
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudieron cargar las preguntas: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Handle answer selection
  void checkAnswer(String selectedAnswer, String correctAnswer) {
    if (selectedAnswer == correctAnswer) {
      _correctAnswers.value++;
    } else {
      _incorrectAnswers.value++;
    }
  }

  // Reset scores and questions
  void resetScores() {
    _correctAnswers.value = 0;
    _incorrectAnswers.value = 0;
  }

  void resetQuestions() {
    _questions.clear();
  }
}
