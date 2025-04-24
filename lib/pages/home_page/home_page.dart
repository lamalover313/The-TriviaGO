import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page/profile_selector.dart';
import 'package:myapp/widgets/custom/cutom_background.dart';
import 'package:myapp/widgets/custom/header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF161218),
      body: Stack(
        children: [
          DarkenedBackground(
            imagePath: 'lib/assets/images/Background_02.png',
          ),
          SafeArea(
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
        ],
      ),
    );
  }
}