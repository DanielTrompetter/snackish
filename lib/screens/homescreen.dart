import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  offset: const Offset(0, 30), // ersetzt negatives Padding
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6), // für den 'glas' Effekt
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.01),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withAlpha(51)),
                        ),
                        child: Center(
                          child: Text(
                            'Feeling Snackish Today?',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 26, 
                                fontWeight: FontWeight.w900,
                                color: Colors.white,),
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
