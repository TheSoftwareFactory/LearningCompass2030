import 'package:flutter/material.dart';
import 'dart:math';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/home/widgets/petal_icon_button.dart';

class IconCircle extends StatelessWidget {
  final double radius;
  final Map<PetalName, Petal> petals;

  IconCircle({this.radius, this.petals});

  Positioned _createStackWidget(double angle, Color color) {
    return Positioned(
      child: PetalIconButton(color: color,),
      left: radius + radius * cos(angle + (pi / 4)),
      bottom: radius - radius * sin(angle + (pi / 4)),

    );
  }

  List<Widget> _createIconStack() {
    List<Widget> list = List<Widget>();
    for (var name in PetalName.values) {
      list.add(_createStackWidget(petals[name].angle, petals[name].color));
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