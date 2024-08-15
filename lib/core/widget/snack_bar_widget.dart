import 'package:flutter/material.dart';
import 'package:hamdars/app/app_strings.dart';
import 'package:hamdars/core/utils/styling/color.dart';

class SnackBarWidget {
  ScaffoldFeatureController snackBar(
    final BuildContext context,
    final String message, {
    final SnackBarBehavior behavior = SnackBarBehavior.fixed,
    final SnackBarAction? action,
    final int duration = 4,
    final int maxLines = 3,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // backgroundColor: darkColor,
        behavior: behavior,
        duration: Duration(seconds: duration),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            behavior == SnackBarBehavior.fixed ? 0 : 12,
          ),
        ),
        content: snackBarMessage(
          message,
          maxLines: maxLines,
        ),
        action: action,
      ),
    );
  }

  Widget snackBarMessage(
    final String message, {
    final int? maxLines = 3,
  }) => Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        message,
        style: TextStyle(fontSize: 13, color: whiteColor1),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );

  SnackBarAction action(final String text, final Function action, {final Color? color}) => SnackBarAction(
      label: text,
      textColor: color ?? primaryColor,
      onPressed: () => action,
    );

  void connectionError(final BuildContext context) {
    snackBar(context, Strings.networkError);
  }

  void connectionErrorWithAction(final BuildContext context, final Function action) {
    snackBar(
      context,
      Strings.networkError,
      action: SnackBarWidget().action(Strings.retry, action),
      duration: 3600,
    );
  }

  void exceptionError(final BuildContext context) {
    snackBar(
      context,
      Strings.retrieveErrorTry,
    );
  }
}
