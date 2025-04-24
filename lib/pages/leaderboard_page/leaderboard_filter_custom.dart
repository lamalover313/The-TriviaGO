import 'package:flutter/material.dart';

class LeaderboardFilter extends StatelessWidget {
  final String? selectedCategory;
  final String? selectedMode;
  final String? selectedDifficulty;
  final void Function(String?) onCategoryChanged;
  final void Function(String?) onModeChanged;
  final void Function(String?) onDifficultyChanged;

  const LeaderboardFilter({
    super.key,
    required this.selectedCategory,
    required this.selectedMode,
    required this.selectedDifficulty,
    required this.onCategoryChanged,
    required this.onModeChanged,
    required this.onDifficultyChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isCategoria = selectedMode == 'categoria';

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          // Filtro de modo
          DropdownButton<String>(
            value: selectedMode,
            hint: const Text('Modo', style: TextStyle(color: Colors.white70)),
            items: const [
              DropdownMenuItem(value: 'random', child: Text('Por Random')),
              DropdownMenuItem(value: 'categoria', child: Text('Por Categoría')),
            ],
            onChanged: onModeChanged,
            dropdownColor: Colors.black87,
            style: const TextStyle(color: Colors.white),
          ),

          // Filtro de categoría 
          if (isCategoria)
            DropdownButton<String>(
              value: selectedCategory,
              hint: const Text('Categoría', style: TextStyle(color: Colors.white70)),
              items: const [
                DropdownMenuItem(value: 'Arte', child: Text('Arte')),
                DropdownMenuItem(value: 'Ciencia', child: Text('Ciencia')),
                DropdownMenuItem(value: 'Deportes', child: Text('Deportes')),
                DropdownMenuItem(value: 'Geografia', child: Text('Geografia')),
                DropdownMenuItem(value: 'Historia', child: Text('Historia')),
              ],
              onChanged: onCategoryChanged,
              dropdownColor: Colors.black87,
              style: const TextStyle(color: Colors.white),
            ),

          // Filtro de dificultad
          if (isCategoria)
            DropdownButton<String>(
              value: selectedDifficulty,
              hint: const Text('Dificultad', style: TextStyle(color: Colors.white70)),
              items: const [
                DropdownMenuItem(value: 'easy', child: Text('Facil')),
                DropdownMenuItem(value: 'medium', child: Text('Media')),
                DropdownMenuItem(value: 'hard', child: Text('Difícil')),
              ],
              onChanged: onDifficultyChanged,
              dropdownColor: Colors.black87,
              style: const TextStyle(color: Colors.white),
            ),
        ],
      ),
    );
  }
}