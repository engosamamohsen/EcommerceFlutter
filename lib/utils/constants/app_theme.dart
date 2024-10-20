import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  var colorTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSeed(seedColor: TColor.primary).copyWith(
      surface: Colors.grey[50]!,
    ),
  );
}
