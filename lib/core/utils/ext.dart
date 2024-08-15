// ignore_for_file: unnecessary_await_in_return

import 'package:flutter/material.dart';

extension ContextUtil on BuildContext {
  Future navToNamed(
    final String name,
  ) async =>
      await Navigator.of(this).pushNamed(
        name,
      );

  Future navTo(
    final Widget widgetBuilder, {
    final bool fullscreenDialog = false,
  }) async =>
      await Navigator.of(this).push(
        MaterialPageRoute(
          builder: (final BuildContext _) => widgetBuilder,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  Future navReplaceBy(
    final Widget widgetBuilder, {
    final bool fullscreenDialog = false,
  }) async =>
      await Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (final _) => widgetBuilder,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  void pop() => Navigator.pop(this);

  void hideKeyboard() => FocusScope.of(this).unfocus();

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
