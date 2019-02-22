import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

class IconCircle extends StatelessWidget {
  final double radius;

  IconCircle({this.radius});

  Positioned _createStackWidget(Petal petal) {
    return Positioned(
      child: PetalIconButton(petal: petal),
      // -1 is used to get rid of slight clipping at the top of the top most icon.
      left: (radius-1) + (radius-1) * cos(petal.angle + (pi / 4)),
      bottom: (radius-1) - (radius-1) * sin(petal.angle + (pi / 4)),
    );
  }

  List<Widget> _createIconStack() {
    List<Widget> list = List<Widget>();
    for (var petal in PETAL_CONSTANTS.toList()) {
      list.add(_createStackWidget(petal));
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