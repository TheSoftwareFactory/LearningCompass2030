import 'package:meta/meta.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

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


  // Later on this initial state will be (partially) loaded from system memory
  // This factory constructor might not even be necessary...
  factory AppState.initial() {
    return AppState(
      number: 80,
      flowerSmall: true,
      petals: {
        PetalName.education: Petal(name: PetalName.education, color: Colors.red, angle: 0.0),
        PetalName.community: Petal(name: PetalName.community, color: Colors.blue, angle: (2 / 11) * pi),
        PetalName.job: Petal(name: PetalName.job, color: Colors.lightBlue, angle: 4 / 11 * pi),
        PetalName.income: Petal(name: PetalName.income, color: Colors.lightGreen, angle: 6 / 11 * pi),
        PetalName.housing: Petal(name: PetalName.housing, color: Colors.indigo, angle: 8 / 11 * pi),
        PetalName.workLifeBalance: Petal(name: PetalName.workLifeBalance, color: Colors.amber, angle: 10 / 11 * pi),
        PetalName.safety: Petal(name: PetalName.safety, color: Colors.blueGrey, angle: 12 / 11 * pi),
        PetalName.lifeSatisfaction: Petal(name: PetalName.lifeSatisfaction, color: Colors.deepOrange, angle: 14 / 11 * pi),
        PetalName.health: Petal(name: PetalName.health, color: Colors.lime, angle: 16 / 11 * pi),
        PetalName.civicEngagement: Petal(name: PetalName.civicEngagement, color: Colors.purple, angle: 18/ 11 * pi),
        PetalName.environment: Petal(name: PetalName.environment, color: Colors.green, angle: 20 / 11 * pi),
      },
    );
  }

  @override
  int get hashCode =>
      number.hashCode ^
      flowerSmall.hashCode ^
      petals.hashCode;


  // Not sure which == for map should be used for this function...
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        number == other.number &&
        flowerSmall == other.flowerSmall &&
        //flowerProgress == other.flowerProgress;
        isProgressIdentical(petals, other.petals);
}

bool isProgressIdentical(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
