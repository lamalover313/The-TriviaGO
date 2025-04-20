import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/classes/questions.dart';

class TriviaController extends GetxController {
  final _questions = <Question>[].obs;
  final _correctAnswers = 0.obs;
  final _incorrectAnswers = 0.obs;
  final selectedDifficulty = ''.obs;

  List<Question> get questions => _questions;
  int get correctAnswers => _correctAnswers.value;
  int get incorrectAnswers => _incorrectAnswers.value;

  String get difficulty => selectedDifficulty.value;
  set difficulty(String value) => selectedDifficulty.value = value;

  Future<void> fetchQuestionsFromUrl(String apiUrl, String difficulty) async {
    try {
      selectedDifficulty.value = difficulty;
      final url = Uri.parse(apiUrl);
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Error al obtener preguntas. Código: ${response.statusCode}');
      }

      final decoded = json.decode(response.body);
      final List<dynamic> data = decoded.values.first as List<dynamic>;

      final allQuestions = data.map((json) => Question.fromJson(json)).toList();
      final filtered = allQuestions.where(
        (q) => q.difficulty.toLowerCase() == difficulty.toLowerCase()
      ).toList();

      _questions.assignAll(filtered);
      resetScores();
    } catch (e) {
      Get.snackbar('Error', 'Falló al cargar preguntas: $e');
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