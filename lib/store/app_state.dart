import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/store/construct_progress_state.dart';
import 'package:learning_compass_exp/store/chapter_state.dart';

@immutable
class AppState {
  final bool flowerSmall;
  final String subroute;
  final Map<PetalName, ConstructProgressState> progress;
  final bool firstStartUp;

  AppState({this.flowerSmall, this.progress, this.subroute, this.firstStartUp});

  AppState copyWith({
    bool flowerSmall,
    String subroute,
    Map<PetalName, ConstructProgressState> progress,
    bool firstStartUp,
  }) {
    return AppState(
      flowerSmall: flowerSmall ?? this.flowerSmall,
      subroute: subroute ?? this.subroute,
      progress: progress ?? this.progress,
      firstStartUp: firstStartUp ?? this.firstStartUp,
    );
  }

  // Used by redux_persist to convert parts of state from persistent storage (which is in JSON form) and convert into an AppState.
  // Uses AppState.initial() to get initial values and replaces appropriate values depending on data gotten from
  // persistent storage.
  static AppState fromJson(dynamic json, List<Map<String, dynamic>> decodedJson) {
    if (json == null || json['progress'] == null || json['progress'] is! Map) return null;


    AppState loadedState = AppState.initial(decodedJson);
    for (PetalName name in PetalName.values) {
      if (json['progress'][name.toString()] == null) continue;
      Map<int, ChapterState> newConstructProgress = new Map<int, ChapterState>();
      for (Map chapter in json['progress'][name.toString()]['constructProgress'].values) {
        if (loadedState.progress[name].constructProgress[chapter['id']] == null) continue;
        ChapterState loadedChapterState = loadedState
            .progress[name]
            .constructProgress[chapter['id']]
            .copyWith(
                read: chapter['read'] as bool,
                foundWords: new List<String>.from(chapter['foundWords']));

        newConstructProgress[chapter['id']] = loadedChapterState;
      }
      loadedState.progress[name] = loadedState
          .progress[name]
          .copyWith(constructProgress: newConstructProgress);
    }

    if (json['firstStartUp'] != null) {
      loadedState =
          loadedState.copyWith(firstStartUp: json['firstStartUp'] as bool);
    }

    return loadedState;
  }

  // Used by redux_persist to convert part of the state into JSON to store persistently. redux_persist serializer
  // knows to call toJson in each petal in the list automatically.
  dynamic toJson() {
    return {
      'progress': {
        PetalName.workLifeBalance.toString():
            progress[PetalName.workLifeBalance],
        PetalName.safety.toString(): progress[PetalName.safety],
        PetalName.lifeSatisfaction.toString():
            progress[PetalName.lifeSatisfaction],
        PetalName.health.toString(): progress[PetalName.health],
        PetalName.civicEngagement.toString():
            progress[PetalName.civicEngagement],
        PetalName.environment.toString(): progress[PetalName.environment],
        PetalName.education.toString(): progress[PetalName.education],
        PetalName.community.toString(): progress[PetalName.community],
        PetalName.job.toString(): progress[PetalName.job],
        PetalName.income.toString(): progress[PetalName.income],
        PetalName.housing.toString(): progress[PetalName.housing],
      },
      'firstStartUp': firstStartUp,
    };
  }

  /// Generates an [AppState] instance with correct initial values.
  ///
  /// [_POINTSFORREAD] has to be manually kept up to date with the similar value
  /// in [ChapterState] if it is changed.
  factory AppState.initial(List<Map<String, dynamic>> decodedJson) {
    const int _POINTSFORREAD = 7;
    AppState initialState = AppState().copyWith(
        progress: Map<PetalName, ConstructProgressState>(),
        flowerSmall: true,
        firstStartUp: true,
        subroute: null
    );
    for (Map<String, dynamic> json in decodedJson) {
      Map<int, ChapterState> constructProgress = Map<int, ChapterState>();
      for (Map<String, dynamic> chapter in json['chapters']) {
        constructProgress[chapter['id']] = ChapterState(
            id: chapter['id'],
            read: false,
            maxProgress: chapter['wordsToFind'].length + _POINTSFORREAD
        );
      }
      initialState.progress[petalNameFromString(json['PetalName'])]
        = ConstructProgressState(id: json['id'], constructProgress: constructProgress);
    }

    return initialState;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          flowerSmall == other.flowerSmall &&
          subroute == other.subroute &&
          isMapEqual(progress, other.progress) &&
          firstStartUp == other.firstStartUp;

  @override
  int get hashCode =>
      flowerSmall.hashCode ^
      subroute.hashCode ^
      progress.hashCode ^
      firstStartUp.hashCode;
}

bool isMapEqual(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
