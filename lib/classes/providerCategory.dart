import 'package:http/http.dart' as http;

class CategoryProvider {
  static const _baseUrl = 'https://trivia-unah-is-77b832a4cf3f.herokuapp.com';

  Future<List<String>> fetchCategories() async {
    final List<String> categories = ['science', 'sports', 'geography', 'history'];
    final List<String> validCategories = [];

    for (final category in categories) {
      final url = Uri.parse('$_baseUrl/${category}_questions_easy');
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          validCategories.add(category);
        }
      } catch (error) {
        // mensaje de error pendiente
      }
    }

    return validCategories;
  }

}