import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppInputDecoration {
  static InputDecoration defaultInputDecoration = InputDecoration(
    fillColor: AppColors.white3,
    filled: true,
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white3, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(9),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white3, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(9),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white3, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(9),
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red1, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(9),
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white3, width: 0.0),
      borderRadius: BorderRadius.all(
        Radius.circular(9),
      ),
    ),
    errorMaxLines: 1,
    alignLabelWithHint: true,
    isDense: true,
    focusColor: AppColors.white3,
    labelStyle: AppTextStyle.normalBlackContentText,
    contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
  );

  static InputDecoration defaultBorderedInputDecoration({
    final bool showErrorText = true,
  }) =>
      InputDecoration(
        fillColor: AppColors.white3,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey5,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey5,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey5,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red1,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white3,
            width: 0.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        errorMaxLines: 1,
        alignLabelWithHint: true,
        isDense: true,
        focusColor: AppColors.white3,
        labelStyle: AppTextStyle.normalBlackContentText,
        errorStyle: showErrorText
            ? const TextStyle(fontSize: 12)
            : const TextStyle(height: 0),
            // : const TextStyle(height: 0.001, fontSize: 0.001),
        contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      );

  static InputDecoration disabledInputDecoration = const InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(borderSide: BorderSide.none),
    isDense: true,
    focusColor: Colors.white,
  );

  static InputDecoration disabledGreyInputDecoration = InputDecoration(
    fillColor: Colors.grey[200],
    filled: true,
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(9),
      ),
    ),
    isDense: true,
    focusColor: Colors.grey[200],
  );
}
