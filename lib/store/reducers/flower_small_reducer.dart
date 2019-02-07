import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';

final flowerSmallReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleFlowerSmallAction>(_toggleFlowerSmall),
]);

bool _toggleFlowerSmall(bool flowerSmall, ToggleFlowerSmallAction action) {
  return !flowerSmall;
}

