import 'package:flutter/material.dart';
import '../theme_utils.dart';

DropdownMenuThemeData dropdownMenuTheme({
  required final String languageCode,
}) =>
    DropdownMenuThemeData(
      textStyle: TextStyle(
        fontFamily: ThemeUtils.fontFromLang(languageCode),
      ),
      inputDecorationTheme: const InputDecorationTheme(),
      menuStyle: const MenuStyle(),
    );
