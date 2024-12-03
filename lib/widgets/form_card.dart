import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const FormCard({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
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
      ),
    );
  }
}