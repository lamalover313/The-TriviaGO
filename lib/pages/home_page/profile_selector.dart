import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/pages/home_page/profile_option.dart';

class ProfileSelector extends StatefulWidget {
  const ProfileSelector({super.key});

  @override
  State<ProfileSelector> createState() => _ProfileSelectorState();
}

class _ProfileSelectorState extends State<ProfileSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      {
        'image': 'lib/assets/images/Categoria_homePage.png',
        'label': 'Categorias',
        'route': '/categoria'
      },
      {
        'image': 'lib/assets/images/Trivia_Random.png',
        'label': 'Random',
        'route': '/trivia-random'
      },
      {
        'image': 'lib/assets/images/Leaderboard_homePage.png',
        'label': 'Tabla de Posiciones',
        'route': '/leaderboard'
      },
    ];

    return FadeTransition(
      opacity: _animation,
      child: ScaleTransition(
        scale: _animation,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final option = options[index];
            return ProfileOption(
              key: ValueKey(option['label']),
              imagePath: option['image']!,
              label: option['label']!,
              onTap: () => context.go(option['route']!),
            );
          },
        ),
      ),
    );
  }
}