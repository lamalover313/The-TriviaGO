import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/models.dart';
import 'package:myapp/classes/providerArte.dart';

class DeportePage extends StatelessWidget {
  final deprovider = DEProvider();
  final dmprovider = DEProvider();
  final dhprovider = DHProvider();

  DeportePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Deporte'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'lib/assets/images/deporte.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.orange.withOpacity(0.6),
                  height: 200,
                  child: const Text(
                    'Bienvenido a la página de Deporte',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 70),
                    ),
                    child: const Text('Botón 1'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 70),
                    ),
                    child: const Text('Botón 2'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 70),
                    ),
                    child: const Text('Botón 3'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 70),
                    ),
                    child: const Text('Botón 4'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
