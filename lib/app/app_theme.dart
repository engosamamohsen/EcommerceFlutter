import 'package:Emend/app/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  var colorTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSeed(seedColor: GlobalColors.mainColor).copyWith(
      surface: Colors.grey[50]!,
    ),
  );
}
