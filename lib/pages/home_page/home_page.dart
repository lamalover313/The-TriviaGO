import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page/profile_selector.dart';
import 'package:myapp/widgets/custom/header_section.dart';
import 'package:myapp/widgets/buttons/start_trivia_button.dart';

class HomePage extends StatelessWidget {
  final String? title;

  const HomePage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0A0E21), 
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  HeaderSection(title: title),
                  const Spacer(),
                  const ProfileSelector(),
                  const Spacer(),
                  const StartTriviaButton(),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}