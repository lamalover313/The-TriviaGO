import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Fin del Juego',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 2,
                  width: 300,
                  color: Colors.blue,
                  margin: const EdgeInsets.only(top: 8),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, size: 50, color: Colors.green),
                    const SizedBox(width: 10),
                    Text(
                      'Respuestas correctas: 10',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel, size: 50, color: Colors.red),
                    const SizedBox(width: 10),
                    Text(
                      'Respuestas incorrectas: 2',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Reintentar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Volver al menú'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Salir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
