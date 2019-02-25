import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/screens/info/info_index.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

class InfoScreen extends StatelessWidget {
  final Petal petal;

  InfoScreen({this.petal});

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopCallback(Function onPop) async {
      await onPop();
      return true;
    }

    return StoreConnector<AppState, Function>(
      converter: (Store<AppState> store) {
        return () => store.dispatch(ChangeSubrouteAction(null));
      },
      builder: (context, onPopCallback) {
        return WillPopScope(child: Scaffold(
            appBar: AppBar(
              title: Text('${petal.toString()}'),
              backgroundColor: petal.color,
            ), body: InfoIndex(subject: petal)
        ),
          onWillPop: () => _willPopCallback(onPopCallback),
        );
      });
    }
}