import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'categoryConfig.dart';
import 'package:myapp/classes/questions.dart';

class TriviaController extends GetxController {
  //TriviaGO
  final _questions = <Question>[].obs;
  final _correctAnswers = 0.obs;
  final _incorrectAnswers = 0.obs;
  final selectedDifficulty = ''.obs;
  //results page
  final RxBool _isRandomMode = false.obs;
  final RxString _currentCategory = ''.obs;

  List<Question> get questions => _questions;
  int get correctAnswers => _correctAnswers.value;
  int get incorrectAnswers => _incorrectAnswers.value;

  String get difficulty => selectedDifficulty.value;
  set difficulty(String value) => selectedDifficulty.value = value;
  
  //normal
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
  //random
  Future<void> fetchRandomMixedQuestions(Map<String, CategoryConfig> categoryMap) async {
  try {
    final Set<String> seenQuestions = {};
    final List<Question> mixedQuestions = [];

    for (final config in categoryMap.values) {
      final response = await http.get(Uri.parse(config.apiUrl));
      if (response.statusCode != 200) continue;

      final decoded = json.decode(response.body);
      final List<dynamic> questionsList = decoded.values.first as List<dynamic>;

      for (var q in questionsList) {
        final question = Question.fromJson(q);
        if (!seenQuestions.contains(question.question)) {
          seenQuestions.add(question.question);
          mixedQuestions.add(question);
        }
      }
    }

    mixedQuestions.shuffle();
    final selectedQuestions = mixedQuestions.take(50).toList();

    _questions.assignAll(selectedQuestions);
    resetScores();
  } catch (e) {
    Get.snackbar('Error', 'No se pudieron cargar preguntas aleatorias: $e');
  }
}

//TriviaGO
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

  //results page - setters
  void setRandomMode(bool isRandom) {
    _isRandomMode.value = isRandom;
  }

  void setCategory(String category) {
    _currentCategory.value = category;
  }
  // results page - Getters
  bool get isRandomMode => _isRandomMode.value;
  String get currentCategory => _currentCategory.value;

}