import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

class InfoBody extends StatelessWidget {
  final PetalName subject;

  InfoBody({this.subject});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<AppState, Petal>(
      converter: (Store<AppState> store) => store.state.petals[subject],
      builder: (context, petal) {
        return Center(
          child: Text('Current progress for ${petal.name} is: ${petal.progress}, and its color is ${petal.color}'),
        );
      },
    );
  }
}
