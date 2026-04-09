import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;

  const GlassButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 200,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        width: width,
        height: height,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 2,
        linearGradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.1), // 10% opacity
            Color.fromRGBO(255, 255, 255, 0.05), // 5% opacity
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.2), // 20% opacity
            Color.fromRGBO(255, 255, 255, 0.1), // 10% opacity
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
