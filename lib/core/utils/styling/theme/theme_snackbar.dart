import 'package:flutter/material.dart';
import '../theme_utils.dart';

SnackBarThemeData snackBarTheme({
  required final String languageCode,
}) =>
    SnackBarThemeData(
      contentTextStyle: TextStyle(
        fontFamily: ThemeUtils.fontFromLang(languageCode),
      ),
    );
