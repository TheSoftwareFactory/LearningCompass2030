import 'package:meta/meta.dart';

import 'package:learning_compass_exp/store/chapter_state.dart';

@immutable
class ConstructProgressState {
  final int id;
  final Map<int, ChapterState> constructProgress;

  ConstructProgressState({this.id, this.constructProgress});

  ConstructProgressState copyWith({
    int id,
    Map<int, ChapterState> constructProgress,
  }) {
    return ConstructProgressState(
      id: id ?? this.id,
      constructProgress: constructProgress ?? this.constructProgress,
    );
  }

  double _getMaxProgress() {
    double maxProgress = 0;
    for (ChapterState chapter in constructProgress.values) {
      maxProgress += chapter.maxProgress;
    }
    return maxProgress;
  }

  double getConstructProgressPerCent() {
    double currentProgress = 0.0;
    for (ChapterState chapter in constructProgress.values) {
      currentProgress += chapter.getChapterProgressAbsolute();
    }

    return currentProgress / _getMaxProgress();
  }

  dynamic toJson() {
    return {
      "id": id,
      "constructProgress": _mapToJson(constructProgress),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConstructProgressState &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          isMapEqual(constructProgress, other.constructProgress);

  @override
  int get hashCode => id.hashCode ^ constructProgress.hashCode;
}

dynamic _mapToJson(Map map) {
  Map<String, dynamic> newMap = Map<String, dynamic>();
  for (MapEntry entry in map.entries) {
    newMap[entry.key.toString()] = entry.value.toJson();
  }

  return newMap;
}

bool isMapEqual(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
