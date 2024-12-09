import 'package:flutter/material.dart';
import 'package:myapp/classes/questionController.dart';
import 'package:get/get.dart';

class PantallaPage extends StatelessWidget {
  final String category;
  final String difficulty;

  const PantallaPage({
    required this.category,
    required this.difficulty,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());

    return Scaffold(
      appBar: AppBar(
        title: Text('$category ($difficulty)'),
      ),
      body: FutureBuilder(
        future: controller.fetchQuestions(category, difficulty),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final questions = controller.questions;
          if (questions.isEmpty) {
            return const Center(child: Text('No questions available'));
          }

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];
              return Card(
                child: Column(
                  children: [
                    ListTile(title: Text(question.question)),
                    ...question.getShuffledAnswers().map((answer) {
                      return TextButton(
                        onPressed: () {
                          controller.checkAnswer(answer, question.correctAnswer);
                        },
                        child: Text(answer),
                      );
                    }),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}