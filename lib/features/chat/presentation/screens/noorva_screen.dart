import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/bottom_input_bar.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/priority_card.dart';
import '../widgets/top_nav_bar.dart';

/// Main screen acting as a Dashboard.
/// Manages the state between 'Home' and 'Guide' views.
class NoorvaScreen extends StatefulWidget {
  const NoorvaScreen({super.key});

  @override
  State<NoorvaScreen> createState() => _NoorvaScreenState();
}

class _NoorvaScreenState extends State<NoorvaScreen> {
  // Simple state management for the assessment UI toggle
  bool _isGuideMode = false;

  void _toggleMode() {
    setState(() {
      _isGuideMode = !_isGuideMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            TopNavBar(
              isGuideMode: _isGuideMode,
              onToggleMode: _toggleMode,
            ),

            // Expanded section takes up all remaining middle space
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // THE WIZARD CHARACTER - Animates its position based on mode
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    bottom: _isGuideMode ? 50 : 120, // Moves down in Guide mode
                    child: Image.asset(
                      'assets/wizard.png',
                      width: 320,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // THE CHAT BUBBLE - Changes text and border based on mode
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _isGuideMode
                          ? const ChatBubble(
                        key: ValueKey('guide_bubble'),
                        text: "I see you are ready for guidance. I will walk with you from here. What should we plan out first?",
                      )
                          : const ChatBubble(
                        key: ValueKey('home_bubble'),
                        text: "Hey Rakesh\n\nYou need to look into your weekend marathon training plan",
                        borderColor: AppColors.accentBorder, // Green border for home
                      ),
                    ),
                  ),

                  // THE PRIORITY CARD - Fades out smoothly when entering Guide Mode
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isGuideMode ? 0.0 : 1.0,
                      // IgnorePointer prevents taps on the invisible card
                      child: IgnorePointer(
                        ignoring: _isGuideMode,
                        child: const PriorityCard(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const BottomInputBar(),
          ],
        ),
      ),
    );
  }
}