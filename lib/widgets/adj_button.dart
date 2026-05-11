import 'package:flutter/material.dart';

// ── Adjust Button ──────────────────────────────────────────────────────────
class AdjButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bg;
  final Color border;
  final VoidCallback onTap;
  //edit
  final double size;
  final double iconSize;

  const AdjButton({
    required this.icon,
    required this.color,
    required this.bg,
    required this.border,
    required this.onTap,
    //edit
    this.size = 50,
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: iconSize),
      ),
    );
  }
}
