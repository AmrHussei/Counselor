import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: GoogleFonts.almarai(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
