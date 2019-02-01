import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/home/index.dart';
import 'package:learning_compass_exp/screens/info/index.dart';

// This widget is the root of your application.
class LearningCompassApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    //middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/income': (context) => InfoScreen(name: PetalName.income,),
        },
        title: 'Learning Compass',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}
