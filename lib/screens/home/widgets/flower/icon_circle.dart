import 'package:flutter/material.dart';
import 'dart:math';

import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon.dart';

class IconCircle extends StatelessWidget {
  final double radius;

  IconCircle({this.radius});

  Positioned _createStackWidget(double angle) {
    return Positioned(
      child: PetalIcon(color: Colors.lightGreen,),
      left: (radius-1) + (radius-1) * cos((angle + (1/4)) * pi),
      bottom: (radius-1) - (radius-1) * sin((angle + (1/4)) * pi),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _createStackWidget(0),
        _createStackWidget(2 / 11),
        _createStackWidget(4 / 11),
        _createStackWidget(6 / 11),
        _createStackWidget(8 / 11),
        _createStackWidget(10 / 11),
        _createStackWidget(12 / 11),
        _createStackWidget(14 / 11),
        _createStackWidget(16 / 11),
        _createStackWidget(18 / 11),
        _createStackWidget(20 / 11),
      ],
    );
  }
}