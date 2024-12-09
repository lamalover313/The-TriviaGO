import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionProvider {
  static const _baseUrl = 'https://trivia-unah-is-77b832a4cf3f.herokuapp.com';

  Future<List<Map<String, dynamic>>> fetchQuestions({
    required String category,
    required String difficulty,
  }) async {
    final String endpoint = '$_baseUrl/${category.toLowerCase()}_questions_${difficulty.toLowerCase()}';
    print("Fetching questions from: $endpoint");
    
    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch questions: ${response.statusCode}');
      }

      final data = json.decode(response.body) as List;
      return data.cast<Map<String, dynamic>>(); 
    } catch (error) {
      throw Exception('Error fetching questions: $error');
    }
  }
}


class CategoryProvider {
  static const _baseUrl = 'https://trivia-unah-is-77b832a4cf3f.herokuapp.com';

  Future<List<String>> fetchCategories() async {
    // Defining the categories as mentioned before
    final List<String> categories = [
      'art', 'science', 'sports', 'geography', 'history',
    ];

    // We'll construct the correct URL for each category and difficulty level.
    List<String> categoryNames = [];

    for (String category in categories) {
      final difficulties = ['easy', 'medium', 'hard'];
      
      // Loop through all difficulty levels for each category
      for (String difficulty in difficulties) {
        final url = Uri.parse('$_baseUrl/${category}_questions_${difficulty}');
        try {
          final response = await http.get(url);
          
          if (response.statusCode == 200) {
            // Add category name if the response is valid.
            categoryNames.add(category);
          } else {
            throw Exception('Failed to fetch category: $category with difficulty: $difficulty');
          }
        } catch (error) {
          throw Exception('Error fetching category $category: $error');
        }
      }
    }

    return categoryNames; // Return all the categories that we found
  }
}



