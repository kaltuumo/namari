import 'package:flutter/material.dart';

/// ✅ Responsive Social Button with BoxDecoration
class CustomSocialButton extends StatelessWidget {
  final Widget iconWidget;
  final VoidCallback onPressed;
  final double size;

  const CustomSocialButton({
    super.key,
    required this.iconWidget,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Center(
            child: SizedBox(
              height: size * 0.6, // image 60% of button
              width: size * 0.6,
              child: iconWidget,
            ),
          ),
        ),
      ),
    );
  }
}
