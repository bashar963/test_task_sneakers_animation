import 'package:flutter/material.dart';

class OvalCustomPainter extends CustomPainter {
  final Color color;

  OvalCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.lineTo(0, 0);

    path.lineTo(0, size.height * 0.40);
    path.quadraticBezierTo(
      size.width / 4,
      size.height - 30,
      size.width / 2,
      size.height - 20,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height * 0.90,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
