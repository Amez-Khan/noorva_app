import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Reusable App Bar. Changes its middle element based on the current mode.
class TopNavBar extends StatelessWidget {
  final bool isGuideMode;
  final VoidCallback onToggleMode; // Callback to trigger UI changes in parent

  const TopNavBar({
    super.key,
    required this.isGuideMode,
    required this.onToggleMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: AppColors.textPrimary),

          // AnimatedSwitcher provides a smooth cross-fade when toggling modes
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isGuideMode
                ? Container(
              key: const ValueKey('guide'),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb_outline, size: 16, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Noorva Guide", style: TextStyle(color: Colors.white)),
                ],
              ),
            )
                : const Text("11:44", key: ValueKey('time'), style: TextStyle(color: Colors.transparent)), // Keeps spacing intact
          ),

          // Tapping this toggles the state for the demo
          GestureDetector(
            onTap: onToggleMode,
            child: Icon(
              isGuideMode ? Icons.edit_square : Icons.notifications_none,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}