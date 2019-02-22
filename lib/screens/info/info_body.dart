import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';

import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

class InfoBody extends StatelessWidget {
  final Petal subject;

  InfoBody({this.subject});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, double>(
      converter: (Store<AppState> store) => store.state.progress[this.subject.name],
      builder: (context, progress) {
        return Center(
          child: Text('Current progress for ${subject.toString()} is: $progress, and its color is ${subject.color}'),
        );
      },
    );
  }
}
