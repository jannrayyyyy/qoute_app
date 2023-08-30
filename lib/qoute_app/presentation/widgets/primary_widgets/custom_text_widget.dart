// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OswaldTextWidget extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final double? maxLine;
  final TextAlign? align;
  const OswaldTextWidget({
    Key? key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.maxLine,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
