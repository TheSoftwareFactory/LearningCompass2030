import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';

// Use this file as a starting-point to build the contents of the page.
// Fill it with Widgets from the /home/widgets directory
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) => store.state.number,
      builder: (context, number) {
        return Center(
          child: Text("Here is your number, ${number}"),
        );
      },
    );
  }
}
