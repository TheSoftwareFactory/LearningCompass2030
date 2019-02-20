import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';
import 'package:learning_compass_exp/data/constants/constants.dart';

class IconCircle extends StatelessWidget {
  final double radius;

  IconCircle({this.radius});

  Positioned _createStackWidget(double angle, Color color, IconData icon) {
    return Positioned(
      child: PetalIconButton(color: color, icon: icon),
      // -1 is used to get rid of slight clipping at the top of the top most icon.
      left: (radius-1) + (radius-1) * cos(angle + (pi / 4)),
      bottom: (radius-1) - (radius-1) * sin(angle + (pi / 4)),
    );
  }

  List<Widget> _createIconStack() {
    List<Widget> list = List<Widget>();
    for (var petal in CONSTANTS.toMap().values) {
      list.add(_createStackWidget(petal.angle, petal.color, petal.icon));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _createIconStack(),
    );
  }
}