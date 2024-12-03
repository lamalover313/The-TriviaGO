import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const SignInButton({super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF6078ea).withOpacity(.3),
                offset: const Offset(0.0, 8.0),
                blurRadius: 8.0),
          ],
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
