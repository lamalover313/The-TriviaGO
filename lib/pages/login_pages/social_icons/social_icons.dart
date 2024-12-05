import 'package:flutter/material.dart';
import 'package:myapp/pages/login_pages/social_icons/social_platforms.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final socialPlatforms = SocialPlatforms.getPlatforms(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialPlatforms.map((platform) {
        return IconButton(
          icon: Icon(platform['icon'] as IconData),
          onPressed: platform['onPressed'] as VoidCallback,
        );
      }).toList(),
    );
  }
}