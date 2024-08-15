import 'package:flutter/material.dart';
import '../color.dart';
import '../theme_utils.dart';

AppBarTheme appBarTheme({
  required final String languageCode,
}) =>
    AppBarTheme(
      // systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontFamily: ThemeUtils.fontFromLang(languageCode),
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: textMain2,
      ),
      iconTheme: IconThemeData(color: textMain2),
      actionsIconTheme: IconThemeData(color: textMain2),
      centerTitle: false,
      // backgroundColor: bgMain4,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
