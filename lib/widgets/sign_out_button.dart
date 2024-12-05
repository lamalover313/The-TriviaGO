import 'package:flutter/material.dart';
import 'package:myapp/services/auth_services.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await AuthServices.signOut();
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      },
      icon: const Icon(Icons.power_settings_new),
    );
  }
}