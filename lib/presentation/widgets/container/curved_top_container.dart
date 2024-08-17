import 'package:flutter/material.dart';
import 'package:hamdars/presentation/widgets/container/curved_container_painter.dart';

class CurvedTopContainer extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final Color? color;
  final Widget child;
  final EdgeInsets? padding;

  const CurvedTopContainer({
    super.key,
    required this.minHeight,
    required this.maxHeight,
    this.color,
    required this.child,
    this.padding,
  });

  @override
  Widget build(final BuildContext context) => CustomPaint(
        size: Size(double.infinity, maxHeight),
        painter: CurvedContainerPainter(
          minHeight: minHeight,
          maxHeight: maxHeight,
          color: color,
        ),
        child: Positioned.fill(
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      );

  @override
  Widget build2(final BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          CustomPaint(
            size: Size(double.infinity, maxHeight),
            painter: CurvedContainerPainter(
              minHeight: minHeight,
              maxHeight: maxHeight,
              color: color,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            ),
          ),
        ],
      );
}
