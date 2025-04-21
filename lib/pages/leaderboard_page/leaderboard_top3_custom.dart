import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Top3Podium extends StatelessWidget {
  final List<DocumentSnapshot> top3;

  const Top3Podium({super.key, required this.top3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (i) {
        final index = i == 0 ? 1 : (i == 1 ? 0 : 2);
        final data = index < top3.length ? top3[index].data() as Map<String, dynamic> : null;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 160 + (index == 1 ? 40 : 0),
          decoration: BoxDecoration(
            color: index == 1
                ? Colors.amber[600]
                : index == 0
                    ? Colors.grey[400]
                    : Colors.brown[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.person, size: 36, color: Colors.white),
              const SizedBox(height: 4),
              Text(
                data?['email']?.split('@').first ?? 'Vacío',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                '${data?['score'] ?? 0}%',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text('${index + 1}°', style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        );
      }),
    );
  }
}