import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

final flowerProgressReducer = combineReducers<Map<PetalName, double>>([
  TypedReducer<Map<PetalName, double>, IncrementPetalProgressAction>(
      _incrementPetalProgress),
  TypedReducer<Map<PetalName, double>, DecrementPetalProgressAction>(
      _decrementPetalProgress),
]);

Map<PetalName, double> _incrementPetalProgress(
    Map<PetalName, double> progress, IncrementPetalProgressAction action) {
  Map<PetalName, double> newMap = Map.from(progress);
  newMap[action.petalName] = newMap[action.petalName] >= 100
      ? newMap[action.petalName]
      : newMap[action.petalName] + 1;
  return newMap;
}

Map<PetalName, double> _decrementPetalProgress(
    Map<PetalName, double> progress, DecrementPetalProgressAction action) {
  Map<PetalName, double> newMap = Map.from(progress);
  newMap[action.petalName] = newMap[action.petalName] <= 50
      ? newMap[action.petalName]
      : newMap[action.petalName] - 1;
  return newMap;
}
