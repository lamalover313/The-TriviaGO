import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String? title;

  const HeaderSection({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title != null ? "Welcome, $title" : "Welcome, Guest",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Choose your profile and start your TriviaGO journey",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}