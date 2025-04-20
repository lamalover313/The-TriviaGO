import 'package:flutter/material.dart'; 

class DifficultyButton extends StatelessWidget {
  final String label;
  final String difficulty;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? textStyle;

  const DifficultyButton({
    super.key,
    required this.label,
    required this.difficulty,
    required this.onPressed,
    required this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color, // Color dentro de decoration
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          height: 50,
          alignment: Alignment.center,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              fixedSize: const Size.fromWidth(500),
              foregroundColor: textStyle?.color ?? Colors.black,
            ),
            child: Text(label, style: textStyle),
          ),
        ),
        const SizedBox(height: 10), // <- Estaba mal posicionado
      ],
    );
  }
}