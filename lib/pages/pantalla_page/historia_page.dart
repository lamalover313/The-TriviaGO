import 'package:flutter/material.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:myapp/classes/questionController.dart';

class HistoriaPage extends StatefulWidget {
  const HistoriaPage({super.key});

  @override
  State<HistoriaPage> createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
  final heprovider = HEProvider();
  final hmprovider = HMProvider();
  final hhprovider = HHProvider();
  final questionController = Get.put(QuestionController());
  int currentQuestionIndex = 0;
  bool isAnswerCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Historia'),
      body: FutureBuilder(
        future: heprovider.getProductsAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error al obtener los productos'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No hay productos'));
          }

          final questionData = snapshot.data!;
          final currentQuestion = questionData[currentQuestionIndex];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      Text(
                        'Pregunta ${currentQuestionIndex + 1}/${questionData.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: (currentQuestionIndex + 1) / questionData.length,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      ),
                    ],
                  ),
                ),

                // Pregunta
                Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                // Opciones de respuesta
                Column(
                  children: [
                    ...[
                      currentQuestion.correctanswer,
                      currentQuestion.incorrectanswer1,
                      currentQuestion.incorrectanswer2,
                      currentQuestion.incorrectanswer3,
                    ].map((option) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, 
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                            shadowColor: Colors.blue.withOpacity(0.5),
                            side: BorderSide(color: Colors.blueAccent, width: 2),
                          ),
                          onPressed: () {
                            setState(() {
                              isAnswerCorrect = option == currentQuestion.correctanswer;
                            });
                            questionController.checkAnswer(option, currentQuestion.correctanswer);
                          },
                          child: Text(
                            option,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList(),

                    // Confirmación de respuesta
                    if (isAnswerCorrect)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          '¡Respuesta Correcta!',
                          style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    else if (isAnswerCorrect != null && !isAnswerCorrect)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Respuesta Incorrecta',
                          style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Botón para siguiente pregunta
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[400],
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        if (currentQuestionIndex < questionData.length - 1) {
                          setState(() {
                            currentQuestionIndex++;
                            isAnswerCorrect = false;
                          });
                        } else {
                          Navigator.pushNamed(context, '/results');
                        }
                      },
                      child: const Text(
                        'Siguiente Pregunta',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}