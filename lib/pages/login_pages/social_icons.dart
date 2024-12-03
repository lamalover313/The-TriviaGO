import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the social icons and their corresponding actions
    final socialPlatforms = [
      {'icon': Icons.facebook, 'onPressed': () {}},
      {'icon': FontAwesomeIcons.google, 'onPressed': () {}},
      {'icon': FontAwesomeIcons.apple, 'onPressed': () {}},
    ];

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
