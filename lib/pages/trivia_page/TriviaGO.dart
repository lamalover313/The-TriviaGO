import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/classes/triviaController.dart';
import 'package:myapp/pages/trivia_page/trivia_layout.dart';

class TriviaGO extends StatelessWidget {
  final String apiUrl;
  final String category;
  final String difficulty;
  final Color baseColor1;
  final Color baseColor2;

  const TriviaGO({
    super.key,
    required this.category,
    required this.difficulty,
    required this.baseColor1,
    required this.baseColor2,
    required this.apiUrl,
  });

  @override
  Widget build(BuildContext context) {
    return TriviaLayout(
      title: category,
      baseColor1: baseColor1,
      baseColor2: baseColor2,
      onInit: () {
        final controller = Get.find<TriviaController>();
        controller.setRandomMode(false);
        controller.setCategory(category);
        controller.fetchQuestionsFromUrl(apiUrl, difficulty);
      },
    );
  }
}
