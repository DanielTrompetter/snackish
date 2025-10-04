import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snackish/helpers/texthelper.dart';
import 'package:snackish/widgets/dropdown.dart';
import 'package:snackish/widgets/foodcarousel.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          // Inhalt darüber
          Padding(
            padding: const EdgeInsets.only(top: 84),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Textblock
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Choose Your Favorite\nSnack',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 30),
                          blurRadius: 180,
                          color: Colors.black.withAlpha(128),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 20),
                // 'Dropdown'
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SnackCategoryDropdown(),
                ),
                // Recommended Food Card
                Transform.translate(offset: Offset(0, -30), 
                  child: RecommendedCard(),
                ),              
                Transform.translate(offset: Offset(0, -90), 
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('We Recommend',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 30),
                            blurRadius: 180,
                            color: Colors.black.withAlpha(128),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // FoodKarussell
                Transform.translate(offset: Offset(0, -80), 
                  child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: FoodCarousel(),
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

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Hintergrund-Blur exakt unter dem Bild
        Transform.scale(
          scale: 0.9,
          child: ClipRRect(
            child: Stack(
              children: [
                // Blur-Ebene
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                // Bild selbst
                Image.asset(
                  'assets/details/cut_card.png',
                  color: Colors.white.withAlpha(255),
                  colorBlendMode: BlendMode.modulate,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),

        // Burger-Overlay
        Transform.translate(
          offset: const Offset(70, 30),
          child: Transform.scale(
            scale: 0.6,
            child: Image.asset(
              'assets/grafiken/burger.png',
              width: double.infinity,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(-40, 0),
          child: Container(
            width: 260,
            height: 220,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SFText(text: "Angi’s Yummy Burger", weight: FontWeight.bold, size: 20, color: Colors.white, align: TextAlign.left),
                const SizedBox(height: 10),
                SFText(text: "Delish vegan burger\nthat tastes like heaven", weight: FontWeight.w400, size: 16, color: Colors.white, align: TextAlign.left),
                const SizedBox(height: 10),
                SFText(text: "􁑐 13.99", weight: FontWeight.bold, size: 20, color: Colors.white, align: TextAlign.left),
                const SizedBox(height: 40),
                // Button mit Gradient-Stroke verpackt 
                // in einem Stack weil da noch überlappende Farbverläufe sind, danke JP!
                Stack(
                  children: [
                    // der äußere Gradient-Stroke
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0xFF, 0xFF, 0xFF, 0.5),
                            Color.fromRGBO(0,0,0,0.5),
                          ],
                        ),
                      ),
                    ),
                    // und der innere Gradient mitsamt Schatten
                    Container(
                      width: 90,
                      height: 40,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF908CF5),
                            Color(0xFFBB8DE1),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x80EA71C5),
                            blurRadius: 30,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      // und endlich der Button... meine Fresse!
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.only(left: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,                          
                          child: InterText(
                            text: 'Add to order', 
                            weight: FontWeight.bold, 
                            size: 12, 
                            color: Colors.white, 
                            align: TextAlign.center
                            ),
                        )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(340, -94),
          child: Row(
            children: [
              Image.asset('assets/grafiken/star.png'),
              SizedBox(width: 4),
              SFText(
                text: '4.8', 
                align: TextAlign.left,
                weight: FontWeight.w400,
                size: 12,
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
            ]
          )
        )
      ],
    );
  }
}


