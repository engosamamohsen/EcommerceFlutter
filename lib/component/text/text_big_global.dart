import 'package:auth/core/app_color.dart';
import 'package:flutter/material.dart';

class TextGlobalBig extends StatefulWidget {
  TextGlobalBig(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.color,
      this.fontWeight});
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  State<TextGlobalBig> createState() => _TextGlobalState();
}

class _TextGlobalState extends State<TextGlobalBig> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          height: 0.9,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          fontSize: widget.fontSize,
          color: widget.color ?? GlobalColors.mainColor),
    );
  }
}
