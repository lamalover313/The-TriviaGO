import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/providerQuestion.dart';

class PantallaPage extends StatelessWidget {
  final Map<String, dynamic> params;

  const PantallaPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final category = params['category'];
    final difficulty = params['difficulty'];
    final questionProvider = QuestionProvider();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('Trivia: $category ($difficulty)'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: FutureBuilder(
        future: questionProvider.fetchQuestions(category, difficulty),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final questions = snapshot.data ?? [];
          if (questions.isEmpty) {
            return const Center(child: Text('No hay preguntas disponibles.',style: TextStyle(fontSize: 18)));
          }

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(title: Text(question.question)),
                    ...[
                      question.correctanswer,
                      question.incorrectanswer1,
                      question.incorrectanswer2,
                      question.incorrectanswer3,
                    ].map((answer) {
                      return TextButton(
                        onPressed: () {
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