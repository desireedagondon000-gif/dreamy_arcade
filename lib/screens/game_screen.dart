import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import '../widgets/bubble.dart';
import 'score_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;
  List<Offset> bubbles = [];
  final Random random = Random();
  Timer? spawnTimer;
  Timer? moveTimer;
  Timer? countdownTimer;
  int timeLeft = 30;
  double bubbleSpeed = 5.0; // faster rising

  @override
  void initState() {
    super.initState();
    startCountdown();
    startSpawningBubbles();
    startMovingBubbles();
  }

  @override
  void dispose() {
    spawnTimer?.cancel();
    moveTimer?.cancel();
    countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (timeLeft > 0) {
        setState(() => timeLeft--);
      } else {
        t.cancel();
        navigateToScore();
      }
    });
  }

  void startSpawningBubbles() {
    spawnTimer = Timer.periodic(const Duration(milliseconds: 300), (t) {
      if (!mounted || timeLeft <= 0) {
        t.cancel();
        return;
      }
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      setState(() {
        bubbles.add(Offset(random.nextDouble() * (width - 50), height));
      });
    });
  }

  void startMovingBubbles() {
    moveTimer = Timer.periodic(const Duration(milliseconds: 30), (t) {
      if (!mounted || timeLeft <= 0) {
        t.cancel();
        return;
      }
      setState(() {
        bubbles = bubbles
            .map((b) => Offset(b.dx, b.dy - bubbleSpeed))
            .where((b) => b.dy > -50)
            .toList();
      });
    });
  }

  void popBubble(int index) {
    if (!mounted) return;
    setState(() {
      bubbles.removeAt(index);
      score += 10;
    });
  }

  void navigateToScore() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ScoreScreen(score: score)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(173, 216, 230, 1),
              Color.fromRGBO(147, 112, 219, 1),
              Color.fromRGBO(255, 182, 193, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Bubbles
            for (int i = 0; i < bubbles.length; i++)
              Positioned(
                left: bubbles[i].dx,
                top: bubbles[i].dy,
                child: Bubble(onTap: () => popBubble(i)),
              ),

            // Score
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                'Score: $score',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Timer
            Positioned(
              top: 50,
              right: 20,
              child: Text(
                'Time: $timeLeft',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
