import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower.dart';

import 'package:learning_compass_exp/screens/home/widgets/grid.dart';

// Use this file as a starting-point to build the contents of the page.
// Fill it with Widgets from the /home/widgets directory
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _flowerSize = 300;

    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) => store.state.number,
      builder: (context, number) {
        return ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Container(
                width: _flowerSize,
                height: _flowerSize,
                //padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: Center(
                  child: Flower(flowerSize: _flowerSize),
                  //padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
                ),
              ),
            ),
            Grid(),
          ],
        );
      },
    );
  }
}
