import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_petal.dart';

class Flower extends StatelessWidget {
  final Map<PetalName, Petal> petals;
  final bool hasIcons;

  Flower({this.petals, this.hasIcons = false});

  @override
  Widget build(BuildContext context) {

    List<Widget> _transformIntoPetals() {
      List<Widget> list = List<Widget>();
      for (var name in PetalName.values) {
        list.add(FlowerPetal(
          angle: petals[name].angle,
          progress: petals[name].progress,
          color: petals[name].color,
        ));
      }
      return list;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Smaller size if the flower has to account for icons.
        double _maxSize = hasIcons ? (75 / 100) * constraints.maxHeight : constraints.maxHeight;
        return Container(
          // half of parent size
          width: _maxSize,
          height: _maxSize,
          // This padding is because the center of the flower is top-left
          padding: EdgeInsets.only(left: _maxSize / 2, top: _maxSize / 2,),
          child: Stack(
            children: _transformIntoPetals(),
          ),
        );
      },
    );
  }
}