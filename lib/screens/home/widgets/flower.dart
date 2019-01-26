import 'package:flutter/material.dart';
import 'dart:math';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower_petal.dart';

class Flower extends StatelessWidget {
  // Using flower size because it's easier sized in parent. Size of the petal
  // is ~flowerSize / 2.
  final double flowerSize;
  final List _petalDetails = [
    {'petalName': PetalName.education, 'angle': 0.0, 'color': Colors.green},
    {'petalName': PetalName.community, 'angle': (2 / 11) * pi, 'color': Colors.red},
    {'petalName': PetalName.job, 'angle': (4 / 11) * pi, 'color': Colors.blue},
    {'petalName': PetalName.income, 'angle': (6 / 11) * pi, 'color': Colors.amber},
    {'petalName': PetalName.housing, 'angle': (8 / 11) * pi, 'color': Colors.blueGrey},
    {'petalName': PetalName.workLifeBalance, 'angle': (10 / 11) * pi, 'color': Colors.cyan},
    {'petalName': PetalName.safety, 'angle': (12 / 11) * pi, 'color': Colors.deepOrange},
    {'petalName': PetalName.lifeSatisfaction, 'angle': (14 / 11) * pi, 'color': Colors.lightGreen},
    {'petalName': PetalName.health, 'angle': (16 / 11) * pi, 'color': Colors.purple},
    {'petalName': PetalName.civicEngagement, 'angle': (18 / 11) * pi, 'color': Colors.indigo},
    {'petalName': PetalName.environment, 'angle': (20 / 11) * pi, 'color': Colors.lime}
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
        maxPetalSize: flowerSize / 2,
        color: details[i]['color'],
        petalName: details[i]['petalName'],
      ));
    }
    return list;
  }
}
