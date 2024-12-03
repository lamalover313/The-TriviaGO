import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const FormCard({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
          ),
        ),
      ],
    );
  }
}