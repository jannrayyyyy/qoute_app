import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OswaldTextWidget extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final double? maxLine;

  const OswaldTextWidget({
    Key? key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.oswald(
          textStyle: TextStyle(fontSize: fontsize, fontWeight: fontWeight)),
    );
  }
}

class CabinSketchTextWidget extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final double? maxLine;

  const CabinSketchTextWidget({
    Key? key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.cabinSketch(
          textStyle: TextStyle(fontSize: fontsize, fontWeight: fontWeight)),
    );
  }
}

class QuickSandTextWidget extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final double? maxLine;

  const QuickSandTextWidget({
    Key? key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          textStyle: TextStyle(fontSize: fontsize, fontWeight: fontWeight)),
    );
  }
}
