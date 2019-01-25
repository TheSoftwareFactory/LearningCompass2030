import 'package:flutter/material.dart';
import 'dart:math';

import 'package:learning_compass_exp/screens/home/widgets/flower_petal.dart';

class Flower extends StatelessWidget {
  // Using flower size because it's easier sized in parent. Size of the petal
  // is ~flowerSize / 2.
  final double flowerSize;
  final List _petalDetails = [
    {'angle': 0.0, 'color': Colors.green},
    {'angle': (2 / 11) * pi, 'color': Colors.red},
    {'angle': (4 / 11) * pi, 'color': Colors.blue},
    {'angle': (6 / 11) * pi, 'color': Colors.amber},
    {'angle': (8 / 11) * pi, 'color': Colors.blueGrey},
    {'angle': (10 / 11) * pi, 'color': Colors.cyan},
    {'angle': (12 / 11) * pi, 'color': Colors.deepOrange},
    {'angle': (14 / 11) * pi, 'color': Colors.lightGreen},
    {'angle': (16 / 11) * pi, 'color': Colors.purple},
    {'angle': (18 / 11) * pi, 'color': Colors.indigo},
    {'angle': (20 / 11) * pi, 'color': Colors.lime}
  ];

  Flower({this.flowerSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      // This padding is because the center of the flower is top-left
      padding: EdgeInsets.only(left: flowerSize / 2, top: flowerSize / 2),
      child: Container(
        height: flowerSize / 2,
        width: flowerSize / 2,
        child: Stack(
          children: _transformIntoPetals(_petalDetails, flowerSize),
        ),
      ),
    );
  }

  List<Widget> _transformIntoPetals(List details, double flowerSize) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < details.length; i++) {
      list.add(FlowerPetal(
        angle: details[i]['angle'],
        petalSize: flowerSize / 2,
        color: details[i]['color'],
      ));
    }
    return list;
  }
}
