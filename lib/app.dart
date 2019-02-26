import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/routes.dart';

// This widget is the root of your application.
class LearningCompassApp extends StatelessWidget {
  final Store<AppState> store;

  LearningCompassApp({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
        title: 'Learning Compass',
        theme: ThemeData(
          primaryColor: Colors.green,
          textTheme: ThemeData().textTheme.copyWith(body1: TextStyle().copyWith(fontSize: 17), title: TextStyle().copyWith(fontSize: 30))
        ),
      ),
    );
  }
}
