import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';

class InfoBody extends StatelessWidget {
  final String content;
  final Petal subject;

  InfoBody({this.subject, this.content});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, double>(
      converter: (Store<AppState> store) => store.state.progress[subject],
      builder: (context, progress) {
        return Center(
          child: Column(
            children: <Widget>[
              Text('Current progress for ${subject.toString()} is: $progress, and its color is ${subject.color}'),
              Text('$content'),
            ],
          ),
        );
    });
  }
}
