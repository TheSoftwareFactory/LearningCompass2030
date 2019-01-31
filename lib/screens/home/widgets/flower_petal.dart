import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower_petal_painter.dart';

class FlowerPetal extends StatelessWidget {
  final double maxPetalSize;
  final double angle;
  final Color color;
  final PetalName petalName;

  FlowerPetal({this.maxPetalSize, this.angle, this.color, this.petalName});

  @override
  Widget build(BuildContext context) {
    // This subtraction is done to leave room between max sized petal and it's icon.
    double _max = maxPetalSize - 45;
    return StoreConnector<AppState, Map>(
      converter: (Store<AppState> store) => store.state.flowerProgress,
      builder: (context, flowerProgress) {
        return Transform.rotate(
          alignment: Alignment.topLeft,
          angle: angle,
          child: Container(
            height: flowerProgress[petalName] >= 100
                ? _max
                : (flowerProgress[petalName] / 100) * _max,
            width: flowerProgress[petalName] >= 100
                ? _max
                : (flowerProgress[petalName] / 100) * _max,
            child: CustomPaint(
              foregroundPainter: FlowerPetalPainter(petalColor: color),
            ),
          ),
        );
      },
    );
  }
}
