import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class TextGlobal extends StatefulWidget {
  TextGlobal(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.color,
      this.maxLines = 1,
      this.fontWeight,
      this.textAlign = TextAlign.start});
  final String text;
  final double fontSize;
  final int maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  @override
  State<TextGlobal> createState() => _TextGlobalState();
}

class _TextGlobalState extends State<TextGlobal> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: widget.textAlign,
      style: TextStyle(
          height: 0.9,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          fontSize: widget.fontSize,
          color: widget.color ?? TColor.primary),
    );
  }
}
