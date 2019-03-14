import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import 'package:learning_compass_exp/data/models/construct_progress_state.dart';

final flowerProgressReducer =
    combineReducers<Map<PetalName, ConstructProgressState>>([
  TypedReducer<Map<PetalName, ConstructProgressState>, SetChapterAsReadAction>(
      _setChapterAsRead),
  TypedReducer<Map<PetalName, ConstructProgressState>, WordFoundAction>(
      _wordFound),
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

Map<PetalName, ConstructProgressState> _wordFound(
    Map<PetalName, ConstructProgressState> progress, WordFoundAction action) {
  Map<PetalName, ConstructProgressState> newMap = Map.from(progress);
  List<String> newWords = List.from(newMap[action.constructName]
      .constructProgress[action.chapterId]
      .foundWords);
  if (!newWords.contains((action.word))) {
    newWords.add(action.word);
    newMap[action.constructName].constructProgress[action.chapterId] =
        newMap[action.constructName]
            .constructProgress[action.chapterId]
            .copyWith(foundWords: newWords);
  }

  return newMap;
}
