import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> waitUntil({
  final int milliseconds = 250,
}) =>
    Future.delayed(
      Duration(milliseconds: milliseconds),
    );

class Utils {
  static const double tinySize = 2.0;
  static const double smallSize = 4.0;
  static const double mediumSize = 8.0;
  static const double largeSize = 16.0;
  static const double semiGiantSize = 24.0;
  static const double giantSize = 32.0;

  static const SizedBox tinyVerticalSizedBox = SizedBox(
    height: tinySize,
  );
  static const SizedBox smallVerticalSizedBox = SizedBox(
    height: smallSize,
  );
  static const SizedBox mediumVerticalSizedBox = SizedBox(
    height: mediumSize,
  );
  static const SizedBox largeVerticalSizedBox = SizedBox(
    height: largeSize,
  );
  static const SizedBox semiGiantVerticalSizedBox = SizedBox(
    height: semiGiantSize,
  );
  static const SizedBox giantVerticalSizedBox = SizedBox(
    height: giantSize,
  );

  static const SizedBox tinyHorizontalSizedBox = SizedBox(
    width: tinySize,
  );
  static const SizedBox smallHorizontalSizedBox = SizedBox(
    width: smallSize,
  );
  static const SizedBox mediumHorizontalSizedBox = SizedBox(
    width: mediumSize,
  );
  static const SizedBox largeHorizontalSizedBox = SizedBox(
    width: largeSize,
  );
  static const SizedBox semiGiantHorizontalSizedBox = SizedBox(
    width: semiGiantSize,
  );
  static const SizedBox giantHorizontalSizedBox = SizedBox(
    width: giantSize,
  );

  static const EdgeInsetsDirectional tinyPadding = EdgeInsetsDirectional.all(
    tinySize,
  );
  static const EdgeInsetsDirectional smallPadding = EdgeInsetsDirectional.all(
    smallSize,
  );
  static const EdgeInsetsDirectional mediumPadding = EdgeInsetsDirectional.all(
    mediumSize,
  );
  static const EdgeInsetsDirectional largePadding = EdgeInsetsDirectional.all(
    largeSize,
  );
  static const EdgeInsetsDirectional semiGiantPadding =
      EdgeInsetsDirectional.all(
    semiGiantSize,
  );
  static const EdgeInsetsDirectional giantPadding = EdgeInsetsDirectional.all(
    giantSize,
  );

  static const EdgeInsetsDirectional pagePadding =
      EdgeInsetsDirectional.all(20.0);

  static const BorderRadius smallBorderRadius = BorderRadius.all(
    Radius.circular(
      smallSize,
    ),
  );
  static const BorderRadius mediumBorderRadius = BorderRadius.all(
    Radius.circular(
      mediumSize,
    ),
  );
  static BorderRadius largeBorderRadius = BorderRadius.all(
    Radius.circular(
      largeSize.r,
    ),
  );
  static const BorderRadius semiGiantBorderRadius = BorderRadius.all(
    Radius.circular(
      semiGiantSize,
    ),
  );
  static const BorderRadius circularBorderRadius = BorderRadius.all(
    Radius.circular(
      50.0,
    ),
  );

  static Future<void> openLink(
          {required final String url,
          final LaunchMode launchMode = LaunchMode.externalApplication}) =>
      _launchUrl(url, launchMode);

  static Future<void> _launchUrl(
      final String url, final LaunchMode launchMode) async {
    try {
      final Uri? uri = Uri.tryParse(url);
      if (uri != null && await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: launchMode,
        );
      }
    } catch (error) {
      debugPrint('download error: $error');
    }
  }

  static void textSelection(final TextEditingController controller) =>
      controller.selection = TextSelection(
          baseOffset: 0, extentOffset: controller.value.text.length);

  static Future<void> moveAppToBackground() async {
    try {
      await const MethodChannel('moveToBackground')
          .invokeMethod('moveToBack');
    } on PlatformException catch (error) {
      debugPrint('moveAppToBackground exception: $error');
    }
  }

  static String fontFamily(final Locale? locale) {
    late String font;

    if (locale?.languageCode == 'en') {
      font = 'Roboto';
    } else if (locale?.languageCode == 'tr') {
      font = 'Amiko';
    } else {
      font = 'IRANSans';
    }

    return font;
  }

  static final TextInputFormatter digitsOnlyWithFarsi =
      // ignore: unnecessary_raw_strings
      FilteringTextInputFormatter.allow(
    RegExp(
      r'[\d۰-۹]',
    ),
  );

  static final TextInputFormatter onlyPersianAlphabet =
      // ignore: unnecessary_raw_strings
      FilteringTextInputFormatter.allow(
    RegExp(
      r'[\u0600-\u06FF ]',
    ),
  );

  static final TextInputFormatter onlyEnglishAlphabet =
      // ignore: unnecessary_raw_strings
      FilteringTextInputFormatter.allow(
    RegExp(
      '[a-zA-Z ]',
    ),
  );

  static final FilteringTextInputFormatter trimInputFiltering =
      FilteringTextInputFormatter.deny(
    RegExp(
      r"\s\b|\b\s",
    ),
  );

  static String convertToHexCode(
    final Color color,
  ) {
    try {
      return '#${color.value.toRadixString(16).substring(2, 8)}';
    } catch (exception) {
      debugPrint('convertToHexCode exception: $exception');
      return '';
    }
  }

  static Future<T> handleMethodError<T>({
    required final String methodName,
    required final String exception,
  }) async {
    debugPrint('$methodName exception: $exception');
    return Future.error(exception);
  }

  static int roundToNearest(
    final int number, {
    final int scale = 15,
  }) {
    final int remaining = number % scale;

    if (remaining > 0) {
      return (number ~/ scale) * scale + scale;
    }

    return number;
  }

  static String? refineIranMobile(
    final String? text,
  ) {
    String? newText;
    if (text == null) {
      newText = text;
    } else if (text.startsWith('+98')) {
      newText = text.replaceFirst('+98', '0');
    } else if (text.startsWith('0098')) {
      newText = text.replaceFirst('0098', '0');
    } else if (text.startsWith('+')) {
      newText = text.replaceFirst('+', '00');
    } else {
      newText = text;
    }
    return newText;
  }
}
