import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/buttons/boton_resultado.dart';
import 'package:myapp/classes/questionController.dart';
import 'package:get/get.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  'Fin del Juego',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 2,
                  width: 300,
                  color: Colors.blueAccent,
                  margin: const EdgeInsets.only(top: 8),
                ),
              ],
            ),
            const Spacer(),
            Obx(
              () {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle,
                            size: 50, color: Colors.green),
                        const SizedBox(width: 10),
                        Text(
                          'Respuestas correctas: ${Get.find<QuestionController>().correctAnswers}',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cancel, size: 50, color: Colors.red),
                        const SizedBox(width: 10),
                        Text(
                          'Respuestas incorrectas: ${Get.find<QuestionController>().incorrectAnswers}',
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonResultado(
                  icon: Icons.category,
                  text: 'Categorías',
                  color: Colors.amber[700]!,
                  onPressed: () {
                    context.go('/categoria');
                  },
                ),
                const SizedBox(width: 10),
                BotonResultado(
                  icon: Icons.home,
                  text: 'Home',
                  color: Colors.red[700]!,
                  onPressed: () {
                    context.go('/home');
                  },
                ),
                const SizedBox(width: 10),
                BotonResultado(
                  icon: Icons.refresh,
                  text: 'Reintentar',
                  color: Colors.teal[400]!,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
