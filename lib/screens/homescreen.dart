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
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bg_startscreen.png',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay-Bild leicht nach unten und rechts
          Transform.translate(
            offset: const Offset(40, 140),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                'assets/grafiken/cupcake_chick.png',
              ),
            ),
          ),
          // Snack-Bild zentriert und leicht nach unten
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(10, 370),
                child: Transform.scale(
                  scale: 1.1,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/details/snack_snack.png',
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 165),
              // Glasbox mit entkoppeltem Blur
              Stack(
                alignment: Alignment.center,
                children: [
                  // Blur-Ebene
                  IgnorePointer(
                    child: Padding(
                      padding: EdgeInsetsGeometry.directional(start: 20, end: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withAlpha(30),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // hier kommt der Content!
                  Container(
                    width: 400,
                    height: 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Feeling Snackish Today?',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Explore Angi’s most popular snack selection and get instantly happy.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                            fontFamily: 'SFPro',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color.fromRGBO(235, 235, 245, 0.6),
                            shadows: [
                              Shadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 60,
                                offset: Offset(0, 30),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Button mit Gradient-Stroke verpackt 
                        // in einem Stack weil da noch überlappende Farbverläufe sind, danke JP!
                        Stack(
                          children: [
                            // der äußere Gradient-Stroke
                            Container(
                              width: 300,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromRGBO(255, 255, 255, 0.5),
                                    Color.fromRGBO(0, 0, 0, 0.5),
                                  ],
                                ),
                              ),
                            ),
                            // und der innere Gradient mitsamt Schatten
                            Container(
                              width: 296,
                              height: 66,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFE970C4),
                                    Color(0xFFF69EA3),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x80EA71C5),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              // und endlich der Button... meine Fresse!
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/showorders');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  fixedSize: const Size(296, 66),
                                ),
                                child: Text(
                                  'Order now',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
