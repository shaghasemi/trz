import 'package:flutter/material.dart';
import '../color.dart';
import '../theme_utils.dart';

TextButtonThemeData textButtonTheme({
  required final String languageCode,
}) =>
    TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (final Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) return Colors.red;
            return null; // Defer to the widget's default.
          },
        ),
        shadowColor: WidgetStateProperty.resolveWith<Color?>(
          (final Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) return Colors.pink;
            return Colors.black; // Defer to the widget's default.
          },
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (final Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return TextStyle(
                // fontFamily: fontFamily == "fa" ? 'iranyekan' : 'opensans',
                fontFamily: ThemeUtils.fontFromLang(languageCode),
              );
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
    );

ElevatedButtonThemeData elevatedButtonTheme({
  required final String languageCode,
}) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (final states) => primaryColor,
        ),
          foregroundColor: WidgetStateProperty.resolveWith(
          (final states) => whiteColor1,
        ),

        padding: WidgetStateProperty.resolveWith(
          (final states) => const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
        shape: WidgetStateProperty.resolveWith(
          (final states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // foregroundColor: WidgetStateProperty.resolveWith((states) => greyText),
        textStyle: WidgetStateProperty.resolveWith(
          (final states) => TextStyle(
            fontFamily: ThemeUtils.fontFromLang(languageCode),
            // fontSize: 24,
            // color: whiteColor1,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

OutlinedButtonThemeData outlinedButtonTheme({
  required final String languageCode,
}) =>
    OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith(
          (final states) => BorderSide(
            width: 3,
            color: primaryColor,
          ),
        ),
        padding: WidgetStateProperty.resolveWith(
          (final states) => const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
        shape: WidgetStateProperty.resolveWith(
          (final states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textStyle: WidgetStateProperty.resolveWith(
          (final states) => TextStyle(
            fontFamily: ThemeUtils.fontFromLang(languageCode),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 27 / 20,
          ),
        ),
      ),
    );
