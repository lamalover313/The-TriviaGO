import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/login_controller.dart';
import 'package:myapp/widgets/form_card.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/sign_in_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _loginUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      await LoginController.signInWithEmailPassword(email, password);
      if (context.mounted) context.go('/home'); 
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $error')));
    } finally {
        setState(() {
          _isLoading = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormCard(
          emailController: _emailController,
          passwordController: _passwordController,
        ),
        SizedBox(height: 40.h),
        SignInButton(
          isLoading: _isLoading,
          onPressed: _loginUser,
        ),
      ],
    );
  }
}