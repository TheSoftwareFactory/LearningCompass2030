import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

final flowerReducer = combineReducers<Map<PetalName, double>>([
  TypedReducer<Map<PetalName, double>, SetPetalSizeAction>(_setFlowerState),
  TypedReducer<Map<PetalName, double>, IncrementPetalProgressAction>( _incrementPetalProgress),
  TypedReducer<Map<PetalName, double>, DecrementPetalProgressAction>( _decrementPetalProgress),
]);

Map<PetalName, double> _setFlowerState(
    Map<PetalName, double> flowerProgress, SetPetalSizeAction action) {
  Map<PetalName, double> newMap = Map.from(flowerProgress);
  newMap[action.petalName] = action.petalSize;
  return newMap;
}

Map<PetalName, double> _incrementPetalProgress(
    Map<PetalName, double> flowerProgress,
    IncrementPetalProgressAction action) {
  Map<PetalName, double> newMap = Map.from(flowerProgress);
  newMap[action.petalName] = newMap[action.petalName] + 1;
  return newMap;
}

Map<PetalName, double> _decrementPetalProgress(
    Map<PetalName, double> flowerProgress,
    DecrementPetalProgressAction action) {
  Map<PetalName, double> newMap = Map.from(flowerProgress);
  newMap[action.petalName] = newMap[action.petalName] > 0
      ? newMap[action.petalName] - 1
      : newMap[action.petalName];
  return newMap;
}
