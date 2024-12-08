import 'package:flutter/material.dart';
import 'package:myapp/classes/providerArte.dart';
import 'package:myapp/widgets/custom/custom_elevated_button.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';
import 'package:myapp/widgets/custom/custom_background_overlay.dart';

class CienciaPage extends StatelessWidget {
  final ceprovider = CEProvider();
  final cmprovider = CMProvider();
  final chprovider = CHProvider();
  CienciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ciencia'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackgroundWithOverlay(
              imagePath: 'lib/assets/images/ciencia.png',
              overlayText: 'Bienvenido a la página de Ciencia',
              overlayColor: Colors.green,
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
