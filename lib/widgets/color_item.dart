import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isSelected ? 60 : 50,
      height: isSelected ? 60 : 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
      ),
    );
  }
}
