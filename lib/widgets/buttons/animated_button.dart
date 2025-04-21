import 'package:flutter/material.dart';

class AnimatedAnswerButton extends StatefulWidget {
  final String answer;
  final VoidCallback? onTap;
  final Color color;

  const AnimatedAnswerButton({
    super.key,
    required this.answer,
    this.onTap,
    required this.color,
  });

  @override
  State<AnimatedAnswerButton> createState() => _AnimatedAnswerButtonState();
}

class _AnimatedAnswerButtonState extends State<AnimatedAnswerButton>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null
          ? () {
              setState(() => _pressed = true);
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() => _pressed = false);
                widget.onTap?.call();
              });
            }
          : null,
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.answer,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(
                Icons.circle_outlined,
                size: 22,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}