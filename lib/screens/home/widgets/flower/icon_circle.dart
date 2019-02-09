import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';

class IconCircle extends StatelessWidget {
  final double radius;
  final Map<PetalName, Petal> petals;

  IconCircle({this.radius, this.petals});

  Positioned _createStackWidget(double angle, Color color, IconData icon) {
    return Positioned(
      child: PetalIconButton(color: color, icon: icon),
      left: (radius-1) + (radius-1) * cos(angle + (pi / 4)),
      bottom: (radius-1) - (radius-1) * sin(angle + (pi / 4)),
    );
  }

  List<Widget> _createIconStack() {
    List<Widget> list = List<Widget>();
    for (var name in PetalName.values) {
      list.add(_createStackWidget(petals[name].angle, petals[name].color, petals[name].icon));
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