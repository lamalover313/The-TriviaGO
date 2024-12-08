import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/login_controller.dart';
import 'package:myapp/widgets/cards/form_card.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/buttons/sign_in_button.dart';

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

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

  
   if (email.isEmpty || password.isEmpty) {
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Please provide both email and password.')),
      );
      setState(() {
       _isLoading = false;
     });
     return; 
   }

   try {
      final user = await LoginController.signInWithEmailPassword(email, password);

      if (user != null) {
       print('Navigation triggered for user: ${user.email}');
       if (context.mounted) context.go('/home');
     } else {
       throw Exception('User is null after sign-in.');
     }
    } catch (error) {
      print('Login error: $error');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $error')));
    } finally {
      setState(() {
        _isLoading = false;
     });
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