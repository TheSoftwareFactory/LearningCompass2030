import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower_petal_painter.dart';

class FlowerPetal extends StatelessWidget {
  final double petalSize;
  final double angle;
  final Color color;

  FlowerPetal({this.petalSize, this.angle, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: petalSize,
      width: petalSize,
      child: Transform.rotate(
        alignment: Alignment.topLeft,
        angle: angle,
        child: CustomPaint(
          foregroundPainter: FlowerPetalPainter(petalColor: color),
        ),
      ),
    );
  }
}

