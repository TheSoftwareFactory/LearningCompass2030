import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import 'package:learning_compass_exp/data/constants/constants.dart';

class InfoBody extends StatelessWidget {
  final PetalName subject;

  InfoBody({this.subject});

  @override
  Widget build(BuildContext context) {
    Petal petal = CONSTANTS.toMap()[this.subject];
    return StoreConnector<AppState, double>(
      converter: (Store<AppState> store) => store.state.progress[this.subject],
      builder: (context, progress) {
        return Center(
          child: Text('Current progress for ${petal.name} is: $progress, and its color is ${petal.color}'),
        );
      },
    );
  }
}
