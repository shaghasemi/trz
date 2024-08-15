import 'package:flutter/material.dart';
import 'color.dart';

ColorScheme get colorScheme => ColorScheme(
      // background: bgMain1,
      // onBackground: bgMain2,
      surfaceTint: bgMain1,
      onSurfaceVariant: bgMain2,
      brightness: Brightness.light,
      error: colorRed1,
      onError: colorRed2,
      onPrimary: Colors.white,
      onSecondary: selectedLabelColor,
      onSurface: bgMain3,
      primary: primaryColor,
      secondary: Colors.blue,
      surface: selectedLabelColor,
    );
