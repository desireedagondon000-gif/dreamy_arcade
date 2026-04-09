import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../widgets/glass_button.dart';
import 'home_screen.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  const ScoreScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 182, 193, 1), // pink
              Color.fromRGBO(147, 112, 219, 1), // purple
              Color.fromRGBO(0, 0, 255, 1), // blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            // Centers the container exactly
            child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth < 400
                    ? constraints.maxWidth * 0.9
                    : 400; // responsive width
                double containerHeight = constraints.maxHeight * 0.4;

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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Your Score',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: containerWidth * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Score Number
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '$score',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: containerWidth * 0.12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Retry Button
                        SizedBox(
                          width: containerWidth * 0.8,
                          child: GlassButton(
                            text: 'Retry',
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeScreen(),
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
