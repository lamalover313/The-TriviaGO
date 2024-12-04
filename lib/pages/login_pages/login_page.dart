import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/login_pages/login_form.dart';
import 'package:myapp/pages/login_pages/social_icons.dart';
import 'package:myapp/widgets/sign_up_section.dart';

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
                  "lib/assets/images/background_04.jpeg",
                  height: 250.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 150.h,
                  left: MediaQuery.of(context).size.width / 2 - 50.w,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const AssetImage(
                      "lib/assets/images/profile_bulldog.png",
                    ),
                  ),
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

/*Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: const LogoSection(),
                ),
                */

/*CircleAvatar(
          radius: 55.r,
          backgroundImage: const AssetImage(
            "lib/assets/images/logo.png",
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          "Trivia GO!",
          style: TextStyle(
            fontFamily: "Poppins-Bold",
            fontSize: 36.sp,
            letterSpacing: .6,
            fontWeight: FontWeight.bold,
          ),
        ),*/