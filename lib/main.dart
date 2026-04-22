import 'package:flutter/material.dart';
import 'features/chat/presentation/screens/noorva_screen.dart';

void main() {
  runApp(const NoorvaApp());
}

class NoorvaApp extends StatelessWidget {
  const NoorvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner for professional screenshot
      title: 'Noorva Assistant',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Inter', // Defaulting to a clean system font
        useMaterial3: true,
      ),
      home: const NoorvaScreen(),
    );
  }
}