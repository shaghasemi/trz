import 'package:flutter/material.dart';

class LanguageRepository {
  Locale getPreferredLocale() {
    return const Locale('fa');
    // Implement your logic to get the preferred locale from persistent storage
  }

  void savePreferredLocale(Locale locale) {
    // Implement your logic to save the locale to persistent storage
  }
}
