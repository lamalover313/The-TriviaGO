import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/categoryConfig.dart';
import 'package:myapp/widgets/buttons/difficulty_button.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final Color color;
  final String imagePath;
  final bool isExpanded;
  final VoidCallback toggleExpansion;

  const CategoryCard({
    super.key,
    required this.text,
    required this.color,
    required this.imagePath,
    required this.isExpanded,
    required this.toggleExpansion,
  });

  void _navigateToTriviaPage(BuildContext context, String difficulty) {
    final config = categoryMap[text];
    if (config != null) {
      context.go(
        '/trivia',
        extra: {
          'category': text,
          'difficulty': difficulty,
          'color1': config.baseColor1,
          'color2': config.baseColor2,
          'apiUrl': config.apiUrl,
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Configuración no encontrada para $text')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
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
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: toggleExpansion,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isExpanded)
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        DifficultyButton(
                          label: 'Fácil',
                          difficulty: 'easy',
                          onPressed: () => _navigateToTriviaPage(context, 'easy'),
                          color: getColorByDifficulty(color.withOpacity(0.5), 'easy'),
                          textStyle: const TextStyle(color: Colors.black87),
                        ),
                        DifficultyButton(
                          label: 'Medio',
                          difficulty: 'medium',
                          onPressed: () => _navigateToTriviaPage(context, 'medium'),
                          color: getColorByDifficulty(color.withOpacity(0.5), 'medium'),
                          textStyle: const TextStyle(color: Colors.black87),
                        ),
                        DifficultyButton(
                          label: 'Difícil',
                          difficulty: 'hard',
                          onPressed: () => _navigateToTriviaPage(context, 'hard'),
                          color: getColorByDifficulty(color.withOpacity(0.5), 'hard'),
                          textStyle: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}