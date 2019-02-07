import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower/flower_petal_painter.dart';

class FlowerPetal extends StatelessWidget {
  final double angle;
  final double progress;
  final Color color;

  FlowerPetal({this.angle, this.progress, this.color});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      alignment: Alignment.topLeft,
      angle: angle,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double _maxWidth = constraints.maxWidth * cos(pi / 4);
          double _maxHeight = constraints.maxHeight * cos(pi / 4);
          return CustomPaint(
            painter: FlowerPetalPainter(petalColor: color),
            size: Size(
              progress >= 100 ? _maxWidth : (progress / 100) * _maxWidth,
              progress >= 100 ? _maxHeight : (progress / 100) * _maxHeight,
            ),
          );
        },
      ),
    );
  }
}
