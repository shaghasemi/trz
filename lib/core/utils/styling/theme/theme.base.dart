import 'package:flutter/material.dart';
import '../color.dart';
import '../color_scheme.dart';
import '../theme_utils.dart';
import 'theme_appbar.dart';
import 'theme_bottom_sheet.dart';
import 'theme_button.dart';
import 'theme_dialog.dart';
import 'theme_dropdown.dart';
import 'theme_icon.dart';
import 'theme_radio.dart';
import 'theme_snackbar.dart';
import 'theme_tabbar.dart';
import 'theme_text.dart';

ThemeData themeBase({
  required final String languageCode,
}) =>
    ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bgMain4,
      colorScheme: colorScheme,
      fontFamily: ThemeUtils.fontFromLang(languageCode),
      textTheme: textTheme,
      textSelectionTheme: textSelectionTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // splashColor: Colors.yellow,
      appBarTheme: appBarTheme(languageCode: languageCode),
      iconTheme: iconTheme(),
      textButtonTheme: textButtonTheme(languageCode: languageCode),
      elevatedButtonTheme: elevatedButtonTheme(languageCode: languageCode),
      outlinedButtonTheme: outlinedButtonTheme(languageCode: languageCode),
      radioTheme: radioTheme(languageCode: languageCode),
      tabBarTheme: tabBarTheme(languageCode: languageCode),
      snackBarTheme: snackBarTheme(languageCode: languageCode),
      dropdownMenuTheme: dropdownMenuTheme(languageCode: languageCode),
      bottomSheetTheme: bottomSheetTheme(languageCode: languageCode),
      dialogTheme: dialogTheme(languageCode: languageCode),
    );
