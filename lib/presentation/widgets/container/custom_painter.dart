import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
/*CustomPaint
(
size: Size(384, 222),
painter: RPSCustomPainter(),
)*/

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(final Canvas canvas, final Size size) {
    final Path path_0 = Path();
    path_0.moveTo(12, 62);
    path_0.cubicTo(12, 62, 79.5, 12, 192, 12);
    path_0.cubicTo(304.5, 12, 372, 62, 372, 62);
    path_0.lineTo(372, 210);
    path_0.lineTo(12, 210);
    path_0.lineTo(12, 62);
    path_0.close();

    final Path path_1 = Path();
    path_0.moveTo(0, 62);
    path_0.cubicTo(12, 62, 79.5, 12, 192, 12);
    path_0.cubicTo(304.5, 12, 372, 62, 372, 62);
    path_0.lineTo(372, 210);
    path_0.lineTo(12, 210);
    path_0.lineTo(12, 62);
    path_0.close();

    final Paint paint_0_fill = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.fill;
    // paint_0_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_0, paint_0_fill);
    canvas.drawPath(path_1, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) {
    return true;
  }
}
