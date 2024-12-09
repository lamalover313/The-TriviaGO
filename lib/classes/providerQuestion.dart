import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/classes/questions.dart';
import 'models.dart';

class QuestionProvider {
  static const String _baseUrl = 'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/';

  Future<List<api>> fetchQuestions(String category, String difficulty) async {
    final validCategories = ['science', 'sports', 'geography', 'history'];
    final validDifficulties = ['easy', 'medium', 'hard'];

    if (!validCategories.contains(category) || !validDifficulties.contains(difficulty)) {
      throw Exception("Categoría o dificultad inválida.");
    }

    final String endpoint = '${category}_questions_$difficulty';
    final Uri url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener las preguntas: ${response.statusCode}");
      }

      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => api.fromJson(item)).toList();
    } catch (error) {
      throw Exception("Error al procesar las preguntas: $error");
    }
  }
}

class QuestionService {
  static Future<List<Question>> fetchQuestions(String category, String difficulty) async {
    try {
      final url = Uri.parse(
          'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/api.php?amount=10&category=$category&difficulty=$difficulty&type=multiple');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['response_code'] == 0) {
          final questions = data['results'] as List;

          return questions.map((q) => Question.fromJson(q)).toList();
        } else {
          throw 'No se encontraron preguntas para la categoría y dificultad seleccionadas.';
        }
      } else {
        throw 'Error en la solicitud: ${response.statusCode}';
      }
    } catch (e) {
      rethrow;
    }
  }
}
