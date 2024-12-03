import 'package:flutter/material.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "New User? ",
          style: TextStyle(fontFamily: "Poppins-Medium"),
        ),
        InkWell(
          onTap: () {
            // Implement SignUp navigation
          },
          child: const Text(
            "SignUp",
            style: TextStyle(
              color: Color(0xFF5d74e3),
              fontFamily: "Poppins-Bold",
            ),
          ),
        ),
      ],
    );
  }
}