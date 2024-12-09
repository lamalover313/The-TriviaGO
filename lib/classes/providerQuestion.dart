import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/classes/questions.dart';

class QuestionProvider {
  static const _baseUrl = 'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/';

  static const List<String> categories = ['science', 'sports', 'geography', 'history'];
  static const List<String> difficulties = ['easy', 'medium', 'hard'];

  Future<List<api>> fetchQuestions(String category, String difficulty) async {
    if (!categories.contains(category) || !difficulties.contains(difficulty)) {
      throw Exception('Invalid category or difficulty');
    }

    final endpoint = '${category}_questions_$difficulty';
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Error fetching questions');
      }

      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Question.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error: $e');
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
