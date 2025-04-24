import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/login_controller.dart';
import 'package:myapp/pages/login_pages/social_icons/social_snackbar.dart';
import 'package:myapp/widgets/cards/form_card.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/buttons/sign_in_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final input = _usernameOrEmailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final user = await LoginController.signInWithUsernameOrEmail(input, password);
      if (user != null && context.mounted) {
        context.go('/home');
      }
    } catch (e) {
      SocialSnackbar.show(context, e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormCard(
            usernameController: _usernameOrEmailController,
            emailController: TextEditingController(),
            passwordController: _passwordController,
            isLogin: true,
          ),
          SizedBox(height: 40.h),
          SignInButton(
            isLoading: _isLoading,
            onPressed: _loginUser,
          ),
        ],
      ),
    );
  }
}
