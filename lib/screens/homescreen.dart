import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Column(
            children: [
              Image.asset(
                'assets/backgrounds/bg_startscreen.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          // Overlay-Bild leicht nach unten und rechts
          Align(
            alignment: Alignment.topLeft,
            child: Transform.scale(
              scale: 1.5,
              child: Transform.translate(
                offset: const Offset(40, 140),
                child: Image.asset(
                  'assets/grafiken/cupcake_chick.png',
                ),
              ),
            ),
          ),
          // Snack-Bild zentriert und leicht nach unten
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: Transform.translate(
                    offset: const Offset(0, 200),
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        'assets/details/snack_snack.png',
                      ),
                    ),
                  ),
                ),
                // 'Glas' Box über dem Bild!
                Transform.translate(
                  offset: const Offset(0, -40), // ersetzt negatives Padding
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // für den 'glas' Effekt
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(51), // 0.2 * 255 = 51
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withAlpha(51)),
                        ),
                        child: const Center(
                          child: Text(
                            'Feeling Snackish Today?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
