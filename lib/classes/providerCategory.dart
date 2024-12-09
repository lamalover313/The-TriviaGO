import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryProvider {
  static const _baseUrl = 'https://trivia-unah-is-77b832a4cf3f.herokuapp.com';

  Future<List<String>> fetchCategories() async {
    final List<String> categories = [
      'science', 'sports', 'geography', 'history',
    ];

    List<String> validCategories = [];

    for (String category in categories) {
      final url = Uri.parse('$_baseUrl/${category}_questions_easy');
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          validCategories.add(category);  
        } else {
          throw Exception('Failed to fetch category: $category');
        }
      } catch (error) {
        throw Exception('Error fetching category $category: $error');
      }
    }

    return validCategories;
  }
}



