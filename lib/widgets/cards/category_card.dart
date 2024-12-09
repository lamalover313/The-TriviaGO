import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void _navigateToPage(BuildContext context, String difficulty) {
    final sanitizedText = text.toLowerCase().replaceAll(' ', '_');
    final route = '/${sanitizedText}_$difficulty';
    context.go(route);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
                      children: ['Facil', 'Medio', 'Dificil'].map((difficulty) {
                        final color = difficulty == 'Facil'
                          ? Colors.white
                          : difficulty == 'Medio'
                          ? Colors.grey.shade300
                          : Colors.grey.shade700;
                        return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 50,
                          color: color,
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => _navigateToPage(context, difficulty.toLowerCase()),
                            child: Text(
                              difficulty,
                              style: TextStyle(
                                color: difficulty == 'Dificil' ? Colors.white70 : Colors.black,
                                fontWeight: difficulty == 'Dificil' ? FontWeight.bold : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* 

 Inside `if (isExpanded)`

*/
