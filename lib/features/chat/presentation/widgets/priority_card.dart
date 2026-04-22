import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// The suggestion card shown only on the Home Screen.
class PriorityCard extends StatelessWidget {
  const PriorityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05), // Subtle glassmorphism effect
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Priority conversation" Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Priority conversation",
              style: TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ),
          const SizedBox(height: 16),

          // Main Title with Arrow
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Help me plan my weekend\nmarathon",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.arrow_outward, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 12),

          // Subtitle
          const Text(
            "A wise choice—preparation shapes endurance.\nLet us structure your weekend with care.",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 20),

          // Progress/Pagination Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: index == 0 ? 8 : 5,
              height: index == 0 ? 8 : 5,
              decoration: BoxDecoration(
                color: index == 0 ? Colors.white : Colors.white30,
                shape: BoxShape.circle,
              ),
            )),
          )
        ],
      ),
    );
  }
}