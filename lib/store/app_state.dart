import 'package:meta/meta.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

@immutable
class AppState {
  // If these variables are objects, could possibly make more complicated states relatively cleanly...?
  final int number;
  final bool flowerSmall;
  final Map<PetalName, Petal> petals;

  AppState({this.number, this.flowerSmall, this.petals});

  AppState copyWith({
    int number,
    bool flowerSmall,
    Map<PetalName, Petal> petals,
  }) {
    return AppState(
      number: number ?? this.number,
      flowerSmall: flowerSmall ?? this.flowerSmall,
      petals: petals ?? this.petals,
    );
  }

  // Used by redux_persist to convert parts of state from persistent storage (which is in JSON form) and convert into an AppState.
  // Uses AppState.initial() to get initial values and replaces appropriate values depending on data gotten from
  // persistent storage.
  static AppState fromJson(dynamic json) {
    if (json == null || json['petals'] == null || json['petals'] is !Iterable) return null;

    AppState loadedState = AppState.initial();
    for (dynamic item in json['petals']) {
      if (item == null || item['name'] == null || item['progress'] == null) continue;
      Petal correspondingPetal = loadedState.petals[petalNameFromString(item['name'])];
      loadedState.petals[petalNameFromString(item['name'])] = correspondingPetal.copyWith(progress: item['progress'].toDouble());
    }

    return loadedState;
  }

  // Used by redux_persist to convert part of the state into JSON to store persistently. redux_persist serializer
  // knows to call toJson in each petal in the list automatically.
  dynamic toJson() {
    return {'petals': petals.values.toList()};
  }

  factory AppState.initial() {
    return AppState(
      number: 80,
      flowerSmall: true,
      petals: {
        PetalName.workLifeBalance: Petal(
            name: PetalName.workLifeBalance,
            color: Colors.red[900],
            angle: 0.0,
            icon: CustomIcons.workLifeBalance),
        PetalName.safety: Petal(
            name: PetalName.safety,
            color: Colors.blueGrey,
            angle: 2 / 11 * pi,
            icon: CustomIcons.safety),
        PetalName.lifeSatisfaction: Petal(
            name: PetalName.lifeSatisfaction,
            color: Colors.orange[600],
            angle: 4 / 11 * pi,
            icon: CustomIcons.lifeSatisfaction),
        PetalName.health: Petal(
            name: PetalName.health,
            color: Colors.purple,
            angle: 6 / 11 * pi,
            icon: CustomIcons.health),
        PetalName.civicEngagement: Petal(
            name: PetalName.civicEngagement,
            color: Colors.amber,
            angle: 8 / 11 * pi,
            icon: CustomIcons.civicEngagement),
        PetalName.environment: Petal(
            name: PetalName.environment,
            color: Colors.green,
            angle: 10 / 11 * pi,
            icon: CustomIcons.environment),
        PetalName.education: Petal(
            name: PetalName.education,
            color: Colors.lightGreen[400],
            angle: 12 / 11 * pi,
            icon: CustomIcons.education),
        PetalName.community: Petal(
            name: PetalName.community,
            color: Colors.red[400],
            angle: 14 / 11 * pi,
            icon: CustomIcons.community),
        PetalName.job: Petal(
            name: PetalName.job,
            color: Colors.blue,
            angle: 16 / 11 * pi,
            icon: CustomIcons.jobs),
        PetalName.income: Petal(
            name: PetalName.income,
            color: Colors.cyan,
            angle: 18 / 11 * pi,
            icon: CustomIcons.income),
        PetalName.housing: Petal(
            name: PetalName.housing,
            color: Colors.teal[300],
            angle: 20 / 11 * pi,
            icon: CustomIcons.housing),
      },
    );
  }

  @override
  int get hashCode =>
      number.hashCode ^
      flowerSmall.hashCode ^
      petals.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        number == other.number &&
        flowerSmall == other.flowerSmall &&
        isMapEqual(petals, other.petals);
}

bool isMapEqual(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
