import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final int index;
  final bool isCurrentUser;

  const ListItem({
    super.key,
    required this.data,
    required this.index,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blueGrey[700] : Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: isCurrentUser ? Border.all(color: Colors.orange, width: 2) : null,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Text('$index', style: const TextStyle(color: Colors.white)),
        ),
        title: Text(data['email'] ?? 'Invitado', style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          '${data['mode'] == 'random' ? 'Trivia Aleatoria' : data['category'] ?? 'Sin categoría'}',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text('${data['score']}%', style: const TextStyle(color: Colors.greenAccent, fontSize: 18)),
      ),
    );
  }
}
