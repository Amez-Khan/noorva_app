import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// A reusable chat bubble that can optionally display an accent border.
class ChatBubble extends StatelessWidget {
  final String text;
  final Color? borderColor;

  const ChatBubble({
    super.key,
    required this.text,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        // Applies border only if a color is provided
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          height: 1.5, // Improves readability
        ),
      ),
    );
  }
}