import 'package:flutter/material.dart';
import 'package:myapp/classes/providerArte.dart';
import 'package:myapp/widgets/custom/custom_elevated_button.dart';
import 'package:myapp/widgets/custom/custom_background_overlay.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';

class GeografiaPage extends StatelessWidget {
  final geprovider = GEProvider();
  final gmprovider = GMProvider();
  final ghprovider = GHProvider();

  GeografiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Geografía'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackgroundWithOverlay(
              imagePath: 'lib/assets/images/geografia.png',
              overlayText: 'Bienvenido a la página de Geografía',
              overlayColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    label: 'Boton 1',
                    onPressed: () => print('Boton 1'),
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    label: 'Boton 2',
                    onPressed: () => print('Boton 2'),
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    label: 'Boton 3',
                    onPressed: () => print('Boton 3'),
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    label: 'Boton 4',
                    onPressed: () => print('Boton 4'),
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
