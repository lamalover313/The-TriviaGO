import 'package:flutter/material.dart';
import 'package:myapp/pages/login_pages/login_controller.dart';
import 'package:myapp/pages/login_pages/social_icons/social_snackbar.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  Future<void> _showSignUpDialog(BuildContext context) async {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Crear cuenta'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Nombre de usuario'),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Ingresa un nombre de usuario.'
                        : null,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Correo electrónico'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return 'Ingresa un correo.';
                      if (!value.contains('@')) return 'Correo inválido.';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) =>
                        value == null || value.length < 6 ? 'Mínimo 6 caracteres.' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                final username = usernameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                try {
                  await LoginController.createUserWithEmailPassword(username, email, password);
                  if (context.mounted) {
                    Navigator.pop(context);
                    SocialSnackbar.show(context, 'Cuenta creada exitosamente.');
                  }
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context);
                    SocialSnackbar.show(context, e.toString());
                  }
                }
              },
              child: const Text('Crear'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showSignUpDialog(context),
      child: const Text(
        "¿No tienes cuenta? Regístrate aquí.",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}