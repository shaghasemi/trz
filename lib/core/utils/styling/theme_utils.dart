import 'package:flutter/material.dart';

import 'const_style.dart';

class ThemeUtils {
  static String fontFamily(final Locale? locale) {
    late String font;

    if (locale?.languageCode == 'fa') {
      font = 'iranyekan';
    } else if (locale?.languageCode == 'en') {
      font = 'opensans';
    } else {
      font = 'opensans';
    }

    return font;
  }

  static String fontFromLang(final String? languageCode) {
    late String font;

    if (languageCode == 'fa') {
      font = ConstStyle.fontPrimary;
    } else if (languageCode == 'en') {
      font = ConstStyle.fontSecondary;
    } else {
      font = ConstStyle.fontSecondary;
    }

    return font;
  }
}
