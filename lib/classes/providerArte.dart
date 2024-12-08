import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/classes/models.dart';

class AFProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/art_questions_easy');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class AMProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/art_questions_medium');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class AHProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/art_questions_hard');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class CEProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/science_questions_easy');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class CMProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/science_questions_medium');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class CHProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/science_questions_hard');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class DEProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/sports_questions_easy');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class DMProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/sports_questions_medium');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class DHProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/sports_questions_hard');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class GEProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/geography_questions_easy');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class GMProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/geography_questions_medium');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class GHProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/geography_questions_hard');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class HEProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/histoy_questions_easy');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class HMProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/histoy_questions_medium');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

class HHProvider {
  Future<List<api>> getProductsAsync() async {
    final Uri url = Uri.parse(
        'https://trivia-unah-is-77b832a4cf3f.herokuapp.com/histoy_questions_hard');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      final data = List<api>.from(
        json.decode(response.body).map((apppi) => api.fromJson(apppi)),
      );
      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
