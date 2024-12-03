import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/login_controller.dart';
import 'package:myapp/pages/login_pages/social_icons.dart';
import 'package:myapp/widgets/form_card.dart';
import 'package:myapp/widgets/logo_section.dart';
import 'package:myapp/widgets/sign_in_button.dart';
import 'package:myapp/widgets/sign_up_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/profile_sailboat.webp", 
                  height: 250.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: const LogoSection(),
                ),
                Positioned(
                  top: 150.h,
                  left: MediaQuery.of(context).size.width / 2 - 50.w,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const AssetImage(
                      "/home/user/myapp/lib/assets/images/illustration.webp", 
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
            FormCard(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            SizedBox(height: 40.h),
            SignInButton(
              isLoading: _isLoading,
              onPressed: _loginUser,
            ),
            SizedBox(height: 20.h),
            const SocialIcons(),
            SizedBox(height: 30.h),
            const SignUpSection(),
          ],
        ),
      ),
    );
  }
}