import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DreamyArcade());
}

class DreamyArcade extends StatelessWidget {
  const DreamyArcade({super.key}); // ✅ super parameter used

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dreamy Arcade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
