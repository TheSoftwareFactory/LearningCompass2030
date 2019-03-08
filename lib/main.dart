import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

void main() async {
  // The required json data involving static construct information is fetched here
  // in order to correctly populate initial state to avoid hardcoding.
  List<Map<String, dynamic>> decodedJson = new List<Map<String, dynamic>>();
  for (Petal petal in PETAL_CONSTANTS.toList()) {
    String jsonData = await rootBundle.loadString(petal.pathToAssetData);
    decodedJson.add(json.decode(jsonData));
  }

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer((json) => AppState.fromJson(json, decodedJson)),
  );

  final initialState = await persistor.load().timeout(Duration(seconds: 5));

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.initial(decodedJson),
    middleware: [persistor.createMiddleware()],
  );

  runApp(LearningCompassApp(store: store));
}
