import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';


// Just used to start the app
void main() async {
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer(AppState.fromJson),
  );

  final initialState = await persistor.load();


  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [persistor.createMiddleware()],
  );

  runApp(LearningCompassApp(store: store));
}