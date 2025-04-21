import 'package:flutter/material.dart';

class LeaderboardFilter extends StatelessWidget {
  final String? selectedCategory;
  final String? selectedMode;
  final void Function(String?) onCategoryChanged;
  final void Function(String?) onModeChanged;

  const LeaderboardFilter({
    super.key,
    required this.selectedCategory,
    required this.selectedMode,
    required this.onCategoryChanged,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<String>(
            value: selectedCategory ?? 'Todos',
            dropdownColor: Colors.grey[900],
            style: const TextStyle(color: Colors.white),
            items: ['Todos', 'Arte', 'Ciencia', 'Deportes', 'Geografía', 'Historia']
                .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                .toList(),
            onChanged: onCategoryChanged,
          ),
          DropdownButton<String>(
            value: selectedMode ?? 'Todos',
            dropdownColor: Colors.grey[900],
            style: const TextStyle(color: Colors.white),
            items: ['Todos', 'random', 'categoria']
                .map((mode) => DropdownMenuItem(value: mode, child: Text(mode)))
                .toList(),
            onChanged: onModeChanged,
          ),
        ],
      ),
    );
  }
}
