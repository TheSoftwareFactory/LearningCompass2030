import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/common/widgets/flower/flower_petal.dart';
import 'package:learning_compass_exp/data/models/construct_progress_state.dart';

import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

class Flower extends StatelessWidget {
  final bool hasIcons;

  Flower({this.hasIcons = false});

  @override
  Widget build(BuildContext context) {

    List<Widget> _transformIntoPetals(
        Map<PetalName, ConstructProgressState> progress) {
      double _minFlowerSize = 50;
      double _maxFlowerSize = 100;
      double _flowerSizeDifference = _maxFlowerSize - _minFlowerSize;

      List<Widget> list = List<Widget>();
      for (var petal in PETAL_CONSTANTS.toList()) {
        list.add(FlowerPetal(
          angle: petal.angle,
          progress: progress != null
              ? _flowerSizeDifference *
                      progress[petal.name].getConstructProgressPerCent() +
                  _minFlowerSize
              : 50,
          color: petal.color,
        ));
      }
      return list;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Smaller size if the flower has to account for icons.
        double _maxSize = hasIcons
            ? (75 / 100) * constraints.maxHeight
            : constraints.maxHeight;
        return StoreConnector<AppState, Map<PetalName, ConstructProgressState>>(
          converter: (Store<AppState> store) => store.state.progress,
          builder: (context, progress) {
            return Container(
              width: _maxSize,
              height: _maxSize,
              // This padding is because the center of the flower is top-left
              padding: EdgeInsets.only(
                left: _maxSize / 2,
                top: _maxSize / 2,
              ),
              child: Stack(
                children: _transformIntoPetals(progress),
              ),
            );
          },
        );
      },
    );
  }
}
