import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';

@immutable
class AppState {
  final bool flowerSmall;
  final String subroute;
  final Map<PetalName, double> progress;
  final bool firstStartUp;

  AppState({this.flowerSmall, this.progress, this.subroute, this.firstStartUp});

  AppState copyWith({
    bool flowerSmall,
    String subroute,
    Map<PetalName, double> progress,
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
    if (json == null || json['progress'] == null || json['progress'] is !Map) return null;

    AppState loadedState = AppState.initial();
    for (PetalName name in PetalName.values) {
      if (json['progress'][name.toString()] == null || json['progress'][name.toString()] <= 50) continue;
      loadedState.progress[name] = json['progress'][name.toString()];
    }
    
    if (json['firstStartUp'] != null) {
      loadedState = loadedState.copyWith(firstStartUp: json['firstStartUp'] as bool);
    }
    
    return loadedState;
  }

  // Used by redux_persist to convert part of the state into JSON to store persistently. redux_persist serializer
  // knows to call toJson in each petal in the list automatically.
  dynamic toJson() {
    return {'progress': {
      PetalName.workLifeBalance.toString(): progress[PetalName.workLifeBalance],
      PetalName.safety.toString(): progress[PetalName.safety],
      PetalName.lifeSatisfaction.toString(): progress[PetalName.lifeSatisfaction],
      PetalName.health.toString(): progress[PetalName.health],
      PetalName.civicEngagement.toString(): progress[PetalName.civicEngagement],
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

  factory AppState.initial() {
    return AppState(
      flowerSmall: true,
      subroute: null,
      progress: {
        PetalName.workLifeBalance: 50,
        PetalName.safety: 50,
        PetalName.lifeSatisfaction: 50,
        PetalName.health: 50,
        PetalName.civicEngagement: 50,
        PetalName.environment: 50,
        PetalName.education: 50,
        PetalName.community: 50,
        PetalName.job: 50,
        PetalName.income: 50,
        PetalName.housing: 50,
      },
      firstStartUp: true,
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
