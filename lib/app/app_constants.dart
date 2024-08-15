import 'package:flutter/material.dart';
import 'package:hamdars/domain/entities/language.dart';

class AppConstants {
  static GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();
  static NavigatorObserver navigatorObserver = NavigatorObserver();

  static List<Language> languages() => [
        Language('فارسی', 'fa'),
        Language('English', 'en'),
        // Language('System Language', 'sys'),
      ];

  static Language language() => languages().first;
}
