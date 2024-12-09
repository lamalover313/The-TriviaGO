import 'package:flutter/material.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerCategory.dart';
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
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
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Georgia', // Estilo tipográfico artístico
                              ),
                            ),
                          ),
                          // Opciones de respuesta con botones interactivos
                          Column(
                            children: [
                              _buildAnswerButton(context, apppi.correctanswer, Colors.green),
                              _buildAnswerButton(context, apppi.incorrectanswer1, Colors.red),
                              _buildAnswerButton(context, apppi.incorrectanswer2, Colors.blue),
                              _buildAnswerButton(context, apppi.incorrectanswer3, Colors.yellow),
                            ],
                          ),
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

  // Función para crear botones con respuesta estilizados
  Widget _buildAnswerButton(BuildContext context, String answer, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: color.withOpacity(0.4),
        ),
        onPressed: () {
          print("Respuesta seleccionada: $answer");
        },
        child: Text(
          answer,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}