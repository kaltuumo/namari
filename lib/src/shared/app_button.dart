import 'package:flutter/material.dart';

// Custom Button Widget
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final double height;
  final double fontSize;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.green,
    this.borderRadius = 8.0,
    this.height = 50, // default height
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // Width-ka ha ahaado auto (default)
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16), // optional padding
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
