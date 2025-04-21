import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/classes/categoryConfig.dart';
import 'package:myapp/classes/triviaController.dart';
import 'package:myapp/pages/trivia_page/trivia_layout.dart';

class TriviaPage extends StatelessWidget {
  final String title;
  final String location;
  final Color baseColor1;
  final Color baseColor2;
  final bool isRandom;
  final String? apiUrl;
  final String? category;
  final String? difficulty;

  const TriviaPage({
    super.key,
    required this.title,
    required this.location,
    required this.baseColor1,
    required this.baseColor2,
    this.isRandom = false,
    this.apiUrl,
    this.category,
    this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return TriviaLayout(
      title: title,
      location: location,
      baseColor1: baseColor1,
      baseColor2: baseColor2,
      onInit: () {
        final controller = Get.find<TriviaController>();
        controller.setRandomMode(isRandom);

        if (isRandom) {
          controller.fetchRandomMixedQuestions(categoryMap);
        } else {
          if (apiUrl != null && difficulty != null && category != null) {
            controller.setCategory(category!);
            controller.fetchQuestionsFromUrl(apiUrl!, difficulty!);
          }
        }
      },
    );
  }
}