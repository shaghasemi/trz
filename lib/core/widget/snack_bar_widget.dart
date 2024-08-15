import 'package:flutter/material.dart';
import 'package:hamdars/app/app_strings.dart';
import 'package:hamdars/core/utils/styling/color.dart';

class SnackBarWidget {
  ScaffoldFeatureController snackBar(
    BuildContext context,
    String message, {
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    SnackBarAction? action,
    int duration = 4,
    int maxLines = 3,
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
    String message, {
    int? maxLines = 3,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        message,
        style: TextStyle(fontSize: 13, color: whiteColor1),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  SnackBarAction action(String text, Function action, {Color? color}) {
    return SnackBarAction(
      label: text,
      textColor: color ?? primaryColor,
      onPressed: () => action,
    );
  }

  void connectionError(BuildContext context) {
    snackBar(context, Strings.networkError);
  }

  void connectionErrorWithAction(BuildContext context, Function action) {
    snackBar(
      context,
      Strings.networkError,
      action: SnackBarWidget().action(Strings.retry, action),
      duration: 3600,
    );
  }

  void exceptionError(BuildContext context) {
    snackBar(
      context,
      Strings.retrieveErrorTry,
    );
  }
}
