import 'package:flutter/material.dart';

class DividerWidget {
  Widget horizontal({
    final bool isMatchParent = true,
    final double width = 72,
    final double thickness = 0.5,
    final double space = 8,
    final Color? color = Colors.grey,
  }) =>
      isMatchParent
          ? divider(
              color!,
              thickness,
              space,
            )
          : SizedBox(
              width: width,
              child: divider(
                color!,
                thickness,
                space,
              ),
            );

  Widget divider(
    final Color color,
    final double thickness,
    final double space,
  ) =>
      Divider(
        color: color,
        thickness: thickness,
        height: space,
      );

  Widget vertical({
    final double height = 32,
    final double space = 24,
    final double thickness = 1,
    final Color? color,
  }) =>
      SizedBox(
        height: height,
        child: VerticalDivider(
          width: space,
          thickness: thickness,
          color: color,
        ),
      );
}
