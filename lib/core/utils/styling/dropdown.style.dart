import 'package:flutter/material.dart';

import 'color.dart';

InputDecoration ddInputDecoration(final String title) => InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: whiteColor1),
      borderRadius: BorderRadius.circular(8),
    ),
    label: Text(
      title,
      style: TextStyle(fontSize: 14, color: bgMain1),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    alignLabelWithHint: true,
  );

TextStyle ddTextStyle() => TextStyle(
    color: bgMain1,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
