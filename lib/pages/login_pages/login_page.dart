import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/login_form.dart';
import 'package:myapp/pages/login_pages/social_icons/social_icons.dart';
import 'package:myapp/widgets/custom/sign_up_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  "lib/assets/images/TriviaLUJO.gif",
                  height: 250.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const LoginForm(),
            SizedBox(height: 20.h),
            const SocialIcons(),
            SizedBox(height: 20.h),
            const SignUpSection(),
          ],
        ),
      ),
    );
  }
}