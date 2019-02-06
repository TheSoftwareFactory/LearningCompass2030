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
    return ListView(
      children: <Widget>[
        StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.flowerSmall,
          builder: (context, flowerSmall) {
            return Container(
              padding: EdgeInsets.only(top: flowerSmall ? 0 : 20),
              child: Align(
                alignment: flowerSmall ? Alignment.topRight : Alignment.center,
                child: Flower(flowerSize: flowerSmall ? 175 : 300),
              ),
            );
          },
        ),
        Grid(),
      ],
    );
  }
}
