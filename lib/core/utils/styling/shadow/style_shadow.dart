import 'package:flutter/material.dart';

class StyleShadow {
  static BoxShadow boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.4),
    spreadRadius: 3,
    blurRadius: 4,
    offset: const Offset(0, 1), // changes position of shadow
  );

  static BoxShadow moreBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 6,
    blurRadius: 25,
    offset: const Offset(0, 1), // changes position of shadow
  );

  static BoxShadow normalShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 3,
    offset: const Offset(0, 1), // changes position of shadow
  );

  static BoxShadow lightBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 5,
    blurRadius: 5,
    offset: const Offset(0, 1), // changes position of shadow
  );

  static BoxShadow rowBoxShadow = BoxShadow(
    color: Colors.black12.withOpacity(0.04),
    spreadRadius: 3,
    blurRadius: 4,
    offset: Offset.zero, // changes position of shadow
  );
}
