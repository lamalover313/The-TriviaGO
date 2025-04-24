import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/home_page/profile_selector.dart';
import 'package:myapp/widgets/custom/cutom_background.dart';
import 'package:myapp/widgets/custom/header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161218),
      body: Stack(
        children: [
          const DarkenedBackground(
            imagePath: 'lib/assets/images/Background_02.png',
          ),
          const SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  AnimatedHeaderSection(),
                  SizedBox(height: 40),
                  ProfileSelector(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Color.fromARGB(255, 245, 11, 11), size: 30),
              tooltip: 'Cerrar sesión',
              onPressed: () {
                context.go('/');
              },
            ),
          ),
        ],
      ),
    );
  }
}