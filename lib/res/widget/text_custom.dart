import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCustom extends StatelessWidget {
  final String textTile;
  final Color color;
  final double fontSized;
  final FontWeight fontWeight;
  const TextCustom(
      {super.key,
      required this.textTile,
      required this.color,
      required this.fontSized,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTile,
      style: GoogleFonts.kanit(
        textStyle: TextStyle(color: color, fontSize: fontSized, fontWeight: fontWeight),
      ),
    );
  }
}
