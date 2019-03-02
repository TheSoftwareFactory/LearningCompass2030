import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import 'package:learning_compass_exp/store/construct_progress_state.dart';

final flowerProgressReducer =
    combineReducers<Map<PetalName, ConstructProgressState>>([
  TypedReducer<Map<PetalName, ConstructProgressState>, SetChapterAsReadAction>(
      _setChapterAsRead),
]);

Map<PetalName, ConstructProgressState> _setChapterAsRead(
    Map<PetalName, ConstructProgressState> progress,
    SetChapterAsReadAction action) {
  Map<PetalName, ConstructProgressState> newMap = Map.from(progress);
  newMap[action.constructName].constructProgress[action.chapterId] =
      newMap[action.constructName]
          .constructProgress[action.chapterId]
          .copyWith(read: true);

  return newMap;
}
