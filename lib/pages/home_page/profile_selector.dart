import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/home_page/profile_option.dart';

class ProfileSelector extends StatelessWidget {
  const ProfileSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProfileOption(
          imagePath: 'lib/assets/images/profile_sailboat.png',
          label: 'Sala de Trofeos',
          onTap: () => context.go('/leaderboard'),
        ),
        ProfileOption(
          imagePath: 'lib/assets/images/CategoUIy.png',
          label: 'Categorias',
          onTap: () => context.go('/categoria'),
        ),
        ProfileOption(
          imagePath: 'lib/assets/images/Trivia_Random.png',
          label: 'Random',
          onTap: () => context.go('/trivia-random'),
        ),
      ],
    );
  }
}