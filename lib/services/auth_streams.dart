import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_pages/login_controller.dart';
import 'package:myapp/pages/login_pages/login_page.dart';

class AuthStreamWidget extends StatelessWidget {
  const AuthStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: LoginController.authStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
      },
    );
  }
}
