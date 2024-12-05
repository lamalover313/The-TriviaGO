import 'package:flutter/material.dart';
import 'package:myapp/widgets/sign_out_button.dart';

class HomePage extends StatelessWidget {
  final String? title;

  const HomePage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title != null ? 'Welcome, $title' : 'Welcome'),
        actions: const [
          SignOutButton(),
        ],
      ),
      body: const Center(
        child: Text('Welcome to TriviaGo!'),
      ),
    );
  }
}