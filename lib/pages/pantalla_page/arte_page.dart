import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerCategory.dart';
import 'package:myapp/classes/questionController.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';

class ArtePage extends StatelessWidget {
  ArtePage({super.key});

  final afprovider = AFProvider();
  final amprovider = AMProvider();
  final ahprovider = AHProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Arte'),
      backgroundColor: const Color(0xFF0A0E21),
      body: FutureBuilder(
        future: afprovider.getProductsAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error al obtener los productos'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No hay productos disponibles'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final api apppi = snapshot.data![index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orangeAccent, Colors.pinkAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Título de la pregunta
                          ListTile(
                            title: Text(
                              apppi.question,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily:
                                    'Georgia', // Estilo tipográfico artístico
                              ),
                            ),
                          ),
                          // Opciones de respuesta con botones interactivos
                          Column(
                            children: [
                              _buildAnswerButton(context, apppi.correctanswer,
                                  0, apppi.correctanswer),
                              _buildAnswerButton(
                                  context,
                                  apppi.incorrectanswer1,
                                  1,
                                  apppi.correctanswer),
                              _buildAnswerButton(
                                  context,
                                  apppi.incorrectanswer2,
                                  2,
                                  apppi.correctanswer),
                              _buildAnswerButton(
                                  context,
                                  apppi.incorrectanswer3,
                                  3,
                                  apppi.correctanswer),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildAnswerButton(
      BuildContext context, String answer, int index, String correctAnswer) {
    QuestionController controller = Get.put(QuestionController());
    return GestureDetector(
      onTap: () {
        controller.checkAnswer(answer, correctAnswer);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Número de la opción
            Text(
              "${index + 1}. $answer",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            // Indicador de selección
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 20,
                color: Colors
                    .transparent, // Esto puede cambiar cuando la respuesta sea seleccionada
              ),
            ),
          ],
        ),
      ),
    );
  }
}
