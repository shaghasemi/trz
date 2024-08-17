import 'package:flutter/material.dart';
import 'package:hamdars/core/utils/styling/app_colors.dart';

class LoadingWidget {
  Widget circular({
    final double size = 20,
    final double strokeWidth = 2,
    final Color? backgroundColor,
    final Color? valueColor,
  }) =>
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              valueColor ?? AppColors.blue1,
            ),
            strokeWidth: strokeWidth,
          ),
        ),
      );
}
