import 'package:flutter/material.dart';

class TabCurvePainter extends CustomPainter {
  final int selectedIndex;
  final double itemSize;
  final double animValue;
  final Color color;

  TabCurvePainter({
    this.color,
    this.selectedIndex,
    this.animValue,
    this.itemSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    double selPos;

    double maxYp = 46;
    double remWidth = ((itemSize - 50) * .4);
    if (remWidth >= 35)
      remWidth = 35;
    else if (remWidth <= 20) remWidth = 5;
    double minYp = 0;
    selPos = (selectedIndex - 1) * itemSize;
    double curveSpace = 40;
    double c1x = selPos + itemSize / 2;
    double c1y = maxYp;
    double cp1x1 = selPos + remWidth;
    double cp1y1 = minYp;
    double cp1x2 = selPos + remWidth;
    double cp1y2 = c1y;
    double cubic2Val = selPos + itemSize;
    double c2x = cubic2Val + curveSpace - remWidth;
    double c2y = minYp;
    double cp2x1 = cubic2Val - remWidth;
    double cp2y1 = maxYp;
    double cp2x2 = cubic2Val - remWidth;
    double cp2y2 = c2y;

    cp1y2 *= animValue;
    cp2y1 *= animValue;
    c1y *= animValue;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(selPos - curveSpace + remWidth, 0)
      ..cubicTo(cp1x1, cp1y1, cp1x2, cp1y2, c1x, c1y)
      ..cubicTo(cp2x1, cp2y1, cp2x2, cp2y2, c2x, c2y)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TabCurvePainter oldDelegate) {
    return oldDelegate.animValue != animValue;
  }
}