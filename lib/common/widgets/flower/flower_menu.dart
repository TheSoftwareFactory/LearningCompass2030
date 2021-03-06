import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/common/widgets/flower/icon_circle.dart';
import 'package:learning_compass_exp/common/widgets/flower/flower.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';


class FlowerMenu extends StatelessWidget {
  // Using flower size because it's easier sized in parent. Size of the petal
  // is ~flowerSize / 2.
  final double flowerSize;
  final bool hasIcons;

  FlowerMenu({this.flowerSize, this.hasIcons = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.green[200], blurRadius: 100)]),
      width: flowerSize,
      height: flowerSize,
      child: Stack(alignment: Alignment.center, children: [
        Flower(
          hasIcons: hasIcons,
        ),
        // Invisible button to control size of the flower. Used to make
        // accidental resizing less likely. Have to click in the middle
        // for this to work. Button is 1/5 the size of the flower.
        StoreConnector<AppState, VoidCallback>(
          converter: (Store<AppState> store) {
            return () {
              store.dispatch(ToggleFlowerSmallAction());
            };
          },
          builder: (context, callback) {
            return GestureDetector(
              onTap: callback,
              child: Container(
                width: flowerSize / 4,
                height: flowerSize / 4,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
            );
          },
        ),
        // 12.5 is half of the iconbutton size
        hasIcons ? IconCircle(radius: flowerSize / 2 - 12.5) : Container(),
      ]),
    );
  }
}
