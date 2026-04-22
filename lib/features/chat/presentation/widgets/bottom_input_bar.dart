import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// The fixed input area at the bottom of the screen.
class BottomInputBar extends StatelessWidget {
  const BottomInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(32), // Pill shape design
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file, color: AppColors.textSecondary),
            onPressed: () {},
          ),

          // "Guide" dropdown chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.chipBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.lightbulb_outline, size: 16, color: Colors.white),
                SizedBox(width: 4),
                Text("Guide", style: TextStyle(color: Colors.white, fontSize: 13)),
                Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.white),
              ],
            ),
          ),

          const Expanded(
            child: TextField(
              style: TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: "Ask Noorva Anything",
                hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),

          IconButton(
            icon: const Icon(Icons.mic, color: AppColors.textSecondary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.graphic_eq, color: AppColors.textSecondary), // Soundwave icon
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}