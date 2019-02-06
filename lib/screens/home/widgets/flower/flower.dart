import 'dart:math';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_petal.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_circle.dart';

class Flower extends StatelessWidget {
  // Using flower size because it's easier sized in parent. Size of the petal
  // is ~flowerSize / 2.
  final double flowerSize;

  Flower({this.flowerSize});

  List<Widget> _transformIntoPetals(
      Map<PetalName, Petal> petals) {
    List<Widget> list = List<Widget>();
    for (var name in PetalName.values) {
      list.add(FlowerPetal(
        angle: petals[name].angle,
        // the divisor is larger than 2 in order to leave room for icons while
        // keeping the size scalable.
        maxPetalSize: flowerSize / 2.5,
        progress: petals[name].progress,
        color: petals[name].color,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<PetalName, Petal>>(
      converter: (Store<AppState> store) => store.state.petals,
      builder: (context, petals) {
        return Container(
          width: flowerSize,
          height: flowerSize,
          child: Stack(children: [
            Container(
              // This padding is because the center of the flower is top-left
              padding:
                  EdgeInsets.only(left: flowerSize / 2, top: flowerSize / 2),
              child: Stack(
                children: _transformIntoPetals(petals),
              ),
            ),
            // 12.5 is half of the iconbutton size
            IconCircle(radius: flowerSize / 2 - 12.5, petals: petals),
          ]),
        );
      },
    );
  }
}
