import 'package:flutter/material.dart';

class FlowerPetalPainter extends CustomPainter {
  final Color petalColor;

  FlowerPetalPainter({this.petalColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = petalColor
      ..style = PaintingStyle.fill;

    Path path1 = Path();
    Path path2 = Path();
    var firstControlPoint = Offset(size.width / 3, size.height / 1.5);
    var firstEndPoint = Offset(size.width, size.height);

    var secondControlPoint = Offset(size.width / 1.5, size.width / 3);
    var secondEndPoint = Offset(size.width, size.height);

    path1.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path2.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    canvas.drawPath(path1, line);
    canvas.drawPath(path2, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
