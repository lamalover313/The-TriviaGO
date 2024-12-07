import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final Color color;
  final String imagePath;
  final VoidCallback onTap;
  final bool isExpanded;
  final VoidCallback toggleExpansion;

  const CategoryCard({
    super.key,
    required this.text,
    required this.color,
    required this.imagePath,
    required this.onTap,
    required this.isExpanded,
    required this.toggleExpansion,
  });

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
                      children: [
                        Container(
                          height: 50,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: const Text('Fácil'),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          color: Colors.grey.shade300,
                          alignment: Alignment.center,
                          child: const Text('Medio'),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          color: Colors.grey.shade700,
                          alignment: Alignment.center,
                          child: const Text('Difícil'),
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
