import 'package:flutter/material.dart';
import '../color.dart';
import '../theme_utils.dart';

TabBarTheme tabBarTheme({
  required final String languageCode,
}) =>
    TabBarTheme(
      labelPadding: const EdgeInsets.symmetric(vertical: 6),
      labelStyle: TextStyle(
        fontFamily: ThemeUtils.fontFromLang(languageCode),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      labelColor: primaryColor,
      unselectedLabelStyle: TextStyle(
        fontFamily: ThemeUtils.fontFromLang(languageCode),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelColor: colorBlack3,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: primaryColor,
          ),
        ),
        color: Colors.transparent,
      ),
    );
