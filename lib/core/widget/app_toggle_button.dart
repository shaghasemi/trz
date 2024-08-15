import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:hamdars/core/utils/styling/app_text_styles.dart';

class AppToggleButton extends StatelessWidget {
  final bool value;
  final bool? hasShadow;
  final Function(bool value) onChange;
  final IconData iconTrue;
  final IconData iconFalse;
  final String textTrue;
  final String textFalse;
  final double? height;

  const AppToggleButton({
    super.key,
    required this.value,
    required this.onChange,
    this.hasShadow,
    required this.iconTrue,
    required this.iconFalse,
    required this.textTrue,
    required this.textFalse,
    this.height,
  });

  @override
  Widget build(final BuildContext context) => AnimatedToggleSwitch<bool>.dual(
        current: value,
        first: false,
        second: true,
        spacing: 46,
        // fittingMode: FittingMode.preventHorizontalOverlapping,
        style: const ToggleStyle(
          borderColor: Colors.black87,
          backgroundColor: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1.5),
            ),
          ],
        ),
        // textDirection: TextDirection.rtl,
        indicatorSize: const Size.square(22),
        borderWidth: 1,
        height: height ?? 28,
        onChanged: onChange,
        styleBuilder: (final bool value) => ToggleStyle(
          indicatorColor: value ? Colors.green : Colors.red,
        ),
        iconBuilder: (final bool value) => value
            ? Icon(
                iconTrue,
                // color: Colors.white,
                size: 16,
              )
            : Icon(
                iconFalse,
                // color: AppColors.white2,
                size: 16,
              ),
        textBuilder: (final bool value) => value
            ? Center(
                child: Text(
                  textTrue,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.toggleTextStyle,
                ),
              )
            : Center(
                child: Text(
                  textFalse,
                  style: AppTextStyle.toggleTextStyle,
                ),
              ),
      );
}
