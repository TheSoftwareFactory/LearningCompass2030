import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

class IncrementerButton extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return StoreConnector<AppState, Function>(
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(IncrementNumberAction());
        };
      },
      builder: (context, callback) {
        return FloatingActionButton(
          onPressed: () => callback(),
          child: Icon(Icons.add),
        );
      }
    );
  }
}