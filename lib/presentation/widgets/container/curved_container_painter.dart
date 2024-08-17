import 'package:flutter/material.dart';

class CurvedContainerPainter extends CustomPainter {
  final double minHeight;
  final double maxHeight;
  final Color? color;

  CurvedContainerPainter({
    required this.minHeight,
    required this.maxHeight,
    this.color,
  });

  @override
  void paint(final Canvas canvas, final Size size) {
    // Draw the shadow
    final Path shadowPath = Path()
      ..moveTo(0, minHeight - 5) // Adjust for shadow position
      ..quadraticBezierTo(
        size.width / 2,
        // -10, // Lower control point for the shadow
        -minHeight,
        size.width,
        minHeight - 5,
      )
      ..lineTo(size.width, maxHeight)
      ..lineTo(0, maxHeight)
      ..close();

    final Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawPath(shadowPath, shadowPaint);

    // Draw the main container
    final Paint paint = Paint()
      ..color = color ?? Colors.blue
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, minHeight)
      ..quadraticBezierTo(
        size.width / 2,
        -minHeight,
        size.width,
        minHeight,
      )
      ..lineTo(size.width, maxHeight)
      ..lineTo(0, maxHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) => false;
}
