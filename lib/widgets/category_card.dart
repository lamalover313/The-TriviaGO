import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final bool isExpanded;
  final VoidCallback toggleExpansion;

  const CategoryCard({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.isExpanded,
    required this.toggleExpansion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Fácil',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      color: Colors.grey[200],
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Medio',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      color: Colors.grey[800],
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Difícil',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
