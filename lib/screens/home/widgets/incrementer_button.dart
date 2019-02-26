import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';


/// Dummy widget to show functionality of random things
class IncrementerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function>(
        converter: (Store<AppState> store) {
      return () {
        store.dispatch(IncrementPetalProgressAction(PetalName.environment));
      };
    }, builder: (BuildContext context, Function callback) {
      return FloatingActionButton(
        onPressed: () {
          return callback();
        },
        child: Icon(Icons.add),
      );
    });
  }
}
