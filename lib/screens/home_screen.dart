import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../widgets/glass_button.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(128, 0, 128, 0.5),
              Color.fromRGBO(0, 0, 255, 0.5),
              Color.fromRGBO(255, 192, 203, 0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            // Center ensures everything is truly centered in both axes
            child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth < 400
                    ? constraints.maxWidth * 0.9
                    : 400; // adaptive width
                double containerHeight = constraints.maxHeight * 0.35;

                return GlassmorphicContainer(
                  width: containerWidth,
                  height: containerHeight,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.1),
                      Color.fromRGBO(255, 255, 255, 0.05),
                    ],
                  ),
                  borderGradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.2),
                      Color.fromRGBO(255, 255, 255, 0.1),
                    ],
                  ),
                  child: Center(
                    // Center ensures child Column is centered exactly
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title
                        Text(
                          'Dreamy Arcade',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: containerWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Start Button
                        SizedBox(
                          width: containerWidth * 0.8, // button width scales
                          child: GlassButton(
                            text: 'Start Game',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const GameScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
