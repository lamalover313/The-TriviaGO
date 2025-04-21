import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/classes/categoryConfig.dart';
import 'package:myapp/classes/triviaController.dart';
import 'package:myapp/pages/trivia_page/trivia_layout.dart';

class TriviaRandomPage extends StatelessWidget {
  final Color baseColor1;
  final Color baseColor2;

  const TriviaRandomPage({
    super.key,
    required this.baseColor1,
    required this.baseColor2,
  });

  @override
  Widget build(BuildContext context) {
    return TriviaLayout(
      title: 'TriviaGO - Random',
      baseColor1: baseColor1,
      baseColor2: baseColor2,
      onInit: () {
        final controller = Get.find<TriviaController>();
        controller.setRandomMode(true);
        controller.fetchRandomMixedQuestions(categoryMap);
      },
    );
  }
}
