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
  static AppState fromJson(dynamic json) {
    if (json == null || json['progress'] == null || json['progress'] is! Map)
      return null;

    AppState loadedState = AppState.initial();
    for (PetalName name in PetalName.values) {
      if (json['progress'][name.toString()] == null) continue;

      Map<int, ChapterState> newConstructProgress =
          new Map<int, ChapterState>();
      for (Map chapter
          in json['progress'][name.toString()]['constructProgress'].values) {
        ChapterState loadedChapterState = loadedState
            .progress[name].constructProgress[chapter['id']]
            .copyWith(
                read: chapter['read'] as bool,
                foundWords: new List<String>.from(chapter['foundWords']));
        newConstructProgress[chapter['id']] = loadedChapterState;
      }
      loadedState.progress[name] = loadedState.progress[name]
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

  // Could maybe be cleaned up or done better...?
  factory AppState.initial() {
    // The values for progress below have to be manually kept up-to-date with
    // static_data files.
    // SUGGESTION: perhaps fetch json files here to help initialize state properly and more
    // reusably. PETAL_CONSTANTS could be used to iterate through each file
    // and relevant data could be extracted that way. This might lead to the fetching
    // being done twice on load atm, since the static fromJson method calls this
    // constructor as well. maxProgress could be calculated based on the json files then as well.
    return AppState(
      flowerSmall: true,
      subroute: null,
      firstStartUp: true,
      progress: {
        PetalName.workLifeBalance:
            ConstructProgressState(id: 1, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.safety: ConstructProgressState(id: 2, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.lifeSatisfaction:
            ConstructProgressState(id: 3, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.health: ConstructProgressState(id: 4, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.civicEngagement:
            ConstructProgressState(id: 5, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          3: ChapterState(
            id: 3,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.environment:
            ConstructProgressState(id: 6, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.education: ConstructProgressState(id: 7, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.community: ConstructProgressState(id: 8, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.job: ConstructProgressState(id: 9, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.income: ConstructProgressState(id: 10, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
        PetalName.housing: ConstructProgressState(id: 11, constructProgress: {
          1: ChapterState(
            id: 1,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
          2: ChapterState(
            id: 2,
            maxProgress: 14, // 9 for read and 1 for each found word
          ),
        }),
      },
    );
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
