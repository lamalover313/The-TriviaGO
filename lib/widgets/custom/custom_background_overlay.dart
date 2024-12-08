import 'package:flutter/material.dart';

class BackgroundWithOverlay extends StatelessWidget {
  final String imagePath;
  final String overlayText;
  final Color overlayColor;

  const BackgroundWithOverlay({
    required this.imagePath,
    required this.overlayText,
    required this.overlayColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          color: overlayColor.withOpacity(0.6),
          height: 200,
          child: Text(
            overlayText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}