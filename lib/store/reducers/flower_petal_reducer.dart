import 'package:redux/redux.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

final flowerPetalReducer = combineReducers<Map<PetalName, Petal>>([
  TypedReducer<Map<PetalName, Petal>, SetPetalSizeAction>(_setFlowerState),
  TypedReducer<Map<PetalName, Petal>, IncrementPetalProgressAction>(
      _incrementPetalProgress),
  TypedReducer<Map<PetalName, Petal>, DecrementPetalProgressAction>(
      _decrementPetalProgress),
]);

Map<PetalName, Petal> _setFlowerState(
    Map<PetalName, Petal> petals, SetPetalSizeAction action) {
  Map<PetalName, Petal> newMap = Map.from(petals);
  newMap[action.petalName] =
      newMap[action.petalName].copyWith(progress: action.petalSize);
  return newMap;
}

Map<PetalName, Petal> _incrementPetalProgress(
    Map<PetalName, Petal> petals, IncrementPetalProgressAction action) {
  Map<PetalName, Petal> newMap = Map.from(petals);
  newMap[action.petalName] = newMap[action.petalName].progress >= 100
      ? newMap[action.petalName]
      : newMap[action.petalName]
          .copyWith(progress: newMap[action.petalName].progress + 1);
  return newMap;
}

Map<PetalName, Petal> _decrementPetalProgress(
    Map<PetalName, Petal> petals, DecrementPetalProgressAction action) {
  Map<PetalName, Petal> newMap = Map.from(petals);
  newMap[action.petalName] = newMap[action.petalName].progress <= 50
      ? newMap[action.petalName]
      : newMap[action.petalName]
      .copyWith(progress: newMap[action.petalName].progress - 1);
  return newMap;
}
