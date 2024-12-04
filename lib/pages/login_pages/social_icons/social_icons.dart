import 'package:flutter/material.dart';
import 'social_platforms.dart';
import 'social_snackbar.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialPlatforms.map((platform) {
        return IconButton(
          icon: Icon(platform['icon'] as IconData),
          onPressed: () => showSnackbar(
            context,
            platform['message'] as String,
          ),
        );
      }).toList(),
    );
  }
}