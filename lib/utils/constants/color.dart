import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TColor {
  //1E9311
  static const Color primary = const Color(0xFF4b68ff);//0xFF4b68ff
  static Color secondary = const Color(0xff00072c);
  static Color accent = const Color(0xffb0c7ff);

  //icon primary
  static Color iconPrimary = const Color(0xff8d8d8d);

  //text colors
  static Color textPrimary = const Color(0xff272727);
  static Color textSecondary = const Color(0xff656565);
  static Color textWhite = const Color(0xffffffff);

  //background color
  static Color light = const Color(0xfff6f6f6);
  static Color dark = const Color(0xff272727);
  static Color backGroundColor = const Color(0xfff2f2f2);

  //background container color
  static Color lightContainer = const Color(0xfff6f6f6);
  static Color darkContainer = TColor.white.withOpacity(0.1);

  //button color
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondary = Color(0xff6c757D);
  static const Color buttonDisable = Color(0xffC4c4c4);

  //border color
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color borderSecondary = Color(0xff313131);

  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976D2);


  static Color black = const Color(0xff232323);
  static Color darkerGrey = const Color(0xff4f4f4f);
  static Color darkGrey = const Color(0xff939393);
  static Color grey = const Color(0xffd9d9d9);
  static Color softGrey = const Color(0xfff4f4f4);
  static Color lightGrey = const Color(0xfff9f9f9);
  static Color white = const Color(0xffffffff);
}
