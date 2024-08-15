import 'package:flutter/material.dart';
import '../color.dart';
import '../theme_utils.dart';

DialogTheme dialogTheme({
  required final String languageCode,
}) =>
    DialogTheme(
      backgroundColor: colorBlack0,
      alignment: Alignment.center,
      titleTextStyle: TextStyle(
        fontFamily: ThemeUtils.fontFromLang(languageCode),
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: colorWhite0,
      ),
    );
