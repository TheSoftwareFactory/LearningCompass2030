import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_menu.dart';
import 'package:learning_compass_exp/screens/home/widgets/grid/grid.dart';

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
            return AnimatedContainer(
              duration: Duration(seconds: 1),
              padding: flowerSmall ? EdgeInsets.only(top: 5, right: 5) : EdgeInsets.only(top: 20),
              child: AnimatedAlign(
                duration: Duration(milliseconds: 1000),
                alignment: flowerSmall ? Alignment.topRight : Alignment.center,
                child: FlowerMenu(
                    flowerSize: flowerSmall ? 100 : 300,
                    hasIcons: !flowerSmall
                ),
              ),
            );
          },
        ),
        Grid(),
      ],
    );
  }
}
