import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 55.r,
          backgroundImage: const AssetImage(
            "lib/assets/images/logo.png",
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          "Welcome!",
          style: TextStyle(
            fontFamily: "Poppins-Bold",
            fontSize: 36.sp,
            letterSpacing: .6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}