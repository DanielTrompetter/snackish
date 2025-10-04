import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SFText extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  final TextAlign? align;
  const SFText({
    super.key,
    required this.text, 
    required this.weight, 
    required this.size, 
    required this.color, 
    required this.align
  });

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "-", 
    textAlign: align ?? TextAlign.center,
    style: 
        TextStyle(
        fontFamily: 'SFPro',
        fontWeight: weight ?? FontWeight.normal,
        fontSize: size ?? 12.0,
        color: color ?? Colors.black,
        shadows: [
          Shadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 60,
          offset: Offset(0, 30),
          ),
        ],
      ),
    );
  }
}

class InterText extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  final TextAlign? align;

  const InterText({
    super.key,
    required this.text,
    required this.weight,
    required this.size,
    required this.color,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      textAlign: align ?? TextAlign.left,
      style: GoogleFonts.inter(
        fontWeight: weight ?? FontWeight.bold,
        fontSize: size ?? 12,
        color: color ?? const Color.fromRGBO(255, 255, 255, 1.0),
        shadows: const [
          Shadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 60,
            offset: Offset(0, 30),
          ),
        ],
      ),
    );
  }
}
