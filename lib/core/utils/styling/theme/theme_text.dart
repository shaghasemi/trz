import 'package:flutter/material.dart';
import '../color.dart';

TextTheme get textTheme => const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        height: 2,
      ),
    );

TextSelectionThemeData get textSelectionTheme => TextSelectionThemeData(
  cursorColor: bgMain2,
);