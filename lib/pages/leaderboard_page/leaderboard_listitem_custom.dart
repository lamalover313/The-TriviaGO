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
    final username = data['username'] ?? 'Invitado';
    final score = data['score'] ?? 0;
    final mode = data['mode'] ?? 'random';
    final category = data['category'] ?? 'Sin categoría';

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blueGrey[700] : Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: isCurrentUser
            ? Border.all(color: Colors.orangeAccent, width: 2)
            : Border.all(color: Colors.transparent),
        boxShadow: [
          if (isCurrentUser)
            BoxShadow(
              color: Colors.orange.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCurrentUser ? Colors.amber : Colors.deepPurple,
          child: Text(
            '$index',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          username,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          mode == 'random' ? 'Trivia Random' : category,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          '$score%',
          style: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}