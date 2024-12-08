import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GeografiaPage extends StatelessWidget {
  const GeografiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Geografía'),
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
                      'lib/assets/images/geografia.png',  
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.blue.withOpacity(0.6),  
                  height: 200,
                  child: const Text(
                    'Bienvenido a la página de Geografía',
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
