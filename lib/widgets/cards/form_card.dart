import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLogin;

  const FormCard({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    this.isLogin = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
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
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: "Usuario o correo",
              hintText: "Ej: juanito123 o juan@gmail.com",
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Este campo no puede estar vacío'
                : null,
          ),
          if (!isLogin) ...[
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Correo electrónico",
                hintText: "Ej: ejemplo@gmail.com",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo es obligatorio';
                }
                if (!value.contains('@')) {
                  return 'Correo inválido';
                }
                return null;
              },
            ),
          ],
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Contraseña",
              hintText: "********",
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'La contraseña es obligatoria'
                : value.length < 6
                    ? 'Debe tener al menos 6 caracteres'
                    : null,
          ),
        ],
      ),
    );
  }
}