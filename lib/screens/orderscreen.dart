import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
          Stack(
            children: [
              // Hintergrundbild
              Image.asset(
                'assets/details/cut_card.png',
                color: Colors.white.withAlpha(111), // volle Deckkraft
                colorBlendMode: BlendMode.modulate,    // ersetzt Alpha
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}
