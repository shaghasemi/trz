import 'package:flutter/material.dart';
import 'package:hamdars/app/app_constants.dart';
import 'app_colors.dart';

class AppTextStyle {
  // static TextTheme get textTheme => Theme.of(Get.context!).textTheme;
  static TextTheme get textTheme => Theme.of(
        AppConstants.globalNavigatorKey.currentContext!,
      ).textTheme;

  static TextStyle get titleLarge => textTheme.titleLarge!;

  static TextStyle get titleMedium => textTheme.titleMedium!;

  static TextStyle get titleSmall => textTheme.titleSmall!;

  static TextStyle get displayLarge => textTheme.displayLarge!;

  static TextStyle get displayMedium => textTheme.displayMedium!;

  static TextStyle get displaySmall => textTheme.displaySmall!;

  static TextStyle get headlineLarge => textTheme.headlineLarge!;

  static TextStyle get headlineMedium => textTheme.headlineMedium!;

  static TextStyle get headlineSmall => textTheme.headlineSmall!;

  static TextStyle get bodyLarge => textTheme.bodyLarge!;

  static TextStyle get bodyMedium => textTheme.bodyMedium!;

  static TextStyle get bodySmall => textTheme.bodySmall!;

  static TextStyle get labelLarge => textTheme.labelLarge!;

  static TextStyle get labelMedium => textTheme.labelMedium!;

  static TextStyle get labelSmall => textTheme.labelSmall!;

  static TextStyle get datePickerSelectedText => titleLarge.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get boldGreyTitleText => titleMedium.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get normalWhiteTitleText => titleMedium.copyWith(
        color: AppColors.white1,
      );

  static TextStyle get normalBlackTitleText => titleMedium;

  static TextStyle get boldBlackTitleText => titleMedium.copyWith(
        color: AppColors.black1,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get normalGreyTitleText => titleSmall.copyWith(
        color: AppColors.grey700,
      );

  static TextStyle get normalHintTitleText => titleSmall.copyWith(
        color: AppColors.grey500,
      );

  static TextStyle get disabledNormalTitleText => titleSmall.copyWith(
        color: AppColors.grey500,
      );

  static TextStyle get normalLightGreyContentText => bodyLarge.copyWith(
        color: AppColors.white3,
      );

  static TextStyle get normalWhiteContentText => bodyLarge.copyWith(
        color: AppColors.white1,
      );

  static TextStyle get normalBlackContentText => bodyLarge.copyWith(
        color: AppColors.black1,
      );

  static TextStyle get normalDarkGreyContentText => bodyLarge.copyWith(
        color: AppColors.grey2,
      );

  static TextStyle get normalHintContentText => bodyLarge.copyWith(
        color: AppColors.grey3,
      );

  static TextStyle get normalWhiteDescriptionText => bodyMedium.copyWith(
        color: AppColors.white1,
      );

  static TextStyle get boldBlackDescriptionText => bodyMedium.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get normalGreyDescriptionText => bodyMedium.copyWith(
        color: AppColors.grey700,
      );

  static TextStyle get boldGreyDescriptionText => bodyMedium.copyWith(
        color: AppColors.grey700,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get normalBlackDescriptionText => bodySmall;

  static TextStyle get normalGreyLight => bodySmall.copyWith(
        color: AppColors.grey5,
      );

  static TextStyle get normalGreyDark => bodySmall.copyWith(
        color: AppColors.grey2,
      );

  static TextStyle get normalGreyText => bodySmall.copyWith(
        color: AppColors.grey500,
      );

  static TextStyle get boldHintDescriptionText => bodySmall.copyWith(
        color: AppColors.grey3,
      );

  static TextStyle get normalWhiteTabText => bodySmall.copyWith(
        color: AppColors.white1,
      );

  static TextStyle get normalHintDescriptionText => bodySmall.copyWith(
        color: AppColors.grey4,
      );

  static TextStyle get toggleTextStyle => const TextStyle(
        fontSize: 14,
        color: AppColors.black1,
      );
}
