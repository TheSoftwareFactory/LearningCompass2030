import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower.dart';

import 'package:learning_compass_exp/screens/home/widgets/grid.dart';

// Use this file as a starting-point to build the contents of the page.
// Fill it with Widgets from the /home/widgets directory
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) => store.state.number,
      builder: (context, number) {
        return ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Flower(flowerSize: 300),
              ),
            ),
            Grid(),
          ],
        );
      },
    );
  }
}
