import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower_petal_painter.dart';

class FlowerPetal extends StatelessWidget {
  final double maxPetalSize;
  final double angle;
  final double progress;
  final Color color;

  FlowerPetal({this.maxPetalSize, this.angle, this.progress, this.color});

  @override
  Widget build(BuildContext context) {
    double _max = maxPetalSize - 30;
    return Transform.rotate(
      alignment: Alignment.topLeft,
      angle: angle,
      child: Container(
        height: progress >= 100 ? _max : (progress / 100) * _max,
        width: progress >= 100 ? _max : (progress / 100) * _max,
        child: CustomPaint(
          foregroundPainter: FlowerPetalPainter(petalColor: color),
        ),
      ),
    );
  }
}
