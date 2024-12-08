import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/boton_resultado.dart';

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
            const Spacer(),
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
