import 'package:flutter/material.dart';

class DarkenedBackground extends StatelessWidget {
  final String imagePath;

  const DarkenedBackground({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.4),
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}