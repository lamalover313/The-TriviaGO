import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/social_icons.dart';
import 'package:myapp/widgets/logo_section.dart';
import 'package:myapp/widgets/sign_up_section.dart';
import 'login_form.dart';

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
                  "lib/assets/images/profile_sailboat.png",
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
                      "lib/assets/images/profile_user.jpg",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
            const LoginForm(),
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