import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart';
import 'size_android.dart' as android;
import 'size_web.dart' as web;
import 'size_windows.dart' as windows;

class SizeConst {
  static double get paddingLarge => kIsWeb
      ? web.Sizes.paddingLarge
      : Platform.isAndroid
          ? android.Sizes.paddingLarge
          : windows.Sizes.paddingLarge;

  static double get paddingMedium => kIsWeb
      ? web.Sizes.paddingMedium
      : Platform.isAndroid
          ? android.Sizes.paddingMedium
          : windows.Sizes.paddingMedium;

  static double get paddingSmall => kIsWeb
      ? web.Sizes.paddingSmall
      : Platform.isAndroid
          ? android.Sizes.paddingSmall
          : windows.Sizes.paddingSmall;
}
