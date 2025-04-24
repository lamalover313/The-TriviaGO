import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Top3Podium extends StatelessWidget {
  final List<DocumentSnapshot> top3;

  const Top3Podium({super.key, required this.top3});

  @override
  Widget build(BuildContext context) {
    final user1 = top3.isNotEmpty ? top3[0].data() as Map<String, dynamic> : null;
    final user2 = top3.length > 1 ? top3[1].data() as Map<String, dynamic> : null;
    final user3 = top3.length > 2 ? top3[2].data() as Map<String, dynamic> : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPodiumBlock(user2, 2, Colors.grey[400], 160),
        _buildPodiumBlock(user1, 1, Colors.amber[600], 200),
        _buildPodiumBlock(user3, 3, Colors.brown[300], 140),
      ],
    );
  }

  Widget _buildPodiumBlock(Map<String, dynamic>? data, int position, Color? color, double height) {
    final username = data?['username'] ?? '???';
    final score = data?['score'] ?? 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(8),
      width: 100,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white24,
            child: Text(
              '$position',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '$score pts',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}