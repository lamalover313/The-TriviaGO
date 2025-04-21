import 'package:flutter/material.dart';

class CategoryConfig {
  final String apiUrl;
  final Color baseColor1;
  final Color baseColor2;

  const CategoryConfig(this.apiUrl, this.baseColor1, this.baseColor2);

}

const Map<String, CategoryConfig> categoryMap = {
  'Arte': CategoryConfig(
    'https://api-theta-rouge-20.vercel.app/Arte_Json.json',
    Colors.orangeAccent, Colors.pinkAccent
  ),
  'Ciencia': CategoryConfig(
    'https://api-theta-rouge-20.vercel.app/Ciencia_Json.json',
    Color.fromARGB(255, 75, 182, 78), Colors.lightGreen
  ),
  'Deportes': CategoryConfig(
    'https://api-theta-rouge-20.vercel.app/Deporte_Json.json',
    Colors.orange, Colors.deepOrange
  ),
  'Geografía': CategoryConfig(
    'https://api-theta-rouge-20.vercel.app/Geografia_Json.json',
    Colors.tealAccent, Colors.cyan
  ),
  'Historia': CategoryConfig(
    'https://api-theta-rouge-20.vercel.app/Historia_Json.json',
    Colors.red, Colors.deepOrange
  ),
};

Color getColorByDifficulty(Color baseColor, String difficulty) {
  switch (difficulty.toLowerCase()) {
    case 'easy':
      return baseColor.withOpacity(0.35);
    case 'medium':
      return baseColor.withOpacity(0.75);
    case 'hard':
      return baseColor.withOpacity(0.95);
    default:
      return Colors.grey;
  }
}