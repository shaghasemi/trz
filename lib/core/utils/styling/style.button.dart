import 'package:flutter/material.dart';
import 'style.text.dart';

ButtonStyle bsElevated = ButtonStyle(
  alignment: Alignment.center,
  padding: WidgetStateProperty.resolveWith(
    (final states) => const EdgeInsets.symmetric(
      horizontal: 36,
      vertical: 16,
    ),
  ),
  textStyle: WidgetStateProperty.resolveWith((final states) => tsButton),
);
