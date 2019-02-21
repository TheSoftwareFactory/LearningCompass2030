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
  final String subroute;

  AppState({this.number, this.flowerSmall, this.petals, this.subroute});

  AppState copyWith({
    int number,
    bool flowerSmall,
    Map<PetalName, Petal> petals,
    String subroute,
  }) {
    return AppState(
      number: number ?? this.number,
      flowerSmall: flowerSmall ?? this.flowerSmall,
      petals: petals ?? this.petals,
      subroute: subroute ?? this.subroute,
    );
  }


  // Later on this initial state will be (partially) loaded from system memory
  // This factory constructor might not even be necessary...
  factory AppState.initial() {
    return AppState(
      number: 80,
      flowerSmall: true,
      petals: {
        PetalName.workLifeBalance: Petal(name: PetalName.workLifeBalance, color: Colors.red[900], angle: 0.0, icon: CustomIcons.workLifeBalance),
        PetalName.safety: Petal(name: PetalName.safety, color: Colors.blueGrey, angle: 2 / 11 * pi, icon: CustomIcons.safety),
        PetalName.lifeSatisfaction: Petal(name: PetalName.lifeSatisfaction, color: Colors.orange[600], angle: 4 / 11 * pi, icon: CustomIcons.lifeSatisfaction),
        PetalName.health: Petal(name: PetalName.health, color: Colors.purple, angle: 6 / 11 * pi, icon: CustomIcons.health),
        PetalName.civicEngagement: Petal(name: PetalName.civicEngagement, color: Colors.amber, angle: 8/ 11 * pi, icon: CustomIcons.civicEngagement),
        PetalName.environment: Petal(name: PetalName.environment, color: Colors.green, angle: 10 / 11 * pi, icon: CustomIcons.environment),
        PetalName.education: Petal(name: PetalName.education, color: Colors.lightGreen[400], angle: 12 / 11 * pi, icon: CustomIcons.education),
        PetalName.community: Petal(name: PetalName.community, color: Colors.red[400], angle: 14 / 11 * pi, icon: CustomIcons.community),
        PetalName.job: Petal(name: PetalName.job, color: Colors.blue, angle: 16 / 11 * pi, icon: CustomIcons.jobs),
        PetalName.income: Petal(name: PetalName.income, color: Colors.cyan, angle: 18 / 11 * pi, icon: CustomIcons.income),
        PetalName.housing: Petal(name: PetalName.housing, color: Colors.teal[300], angle: 20 / 11 * pi, icon: CustomIcons.housing),
      },
      subroute: null,
    );
  }

  @override
  int get hashCode =>
      number.hashCode ^
      flowerSmall.hashCode ^
      petals.hashCode ^
      subroute.hashCode;


  // Not sure which == for map should be used for this function...
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        number == other.number &&
        flowerSmall == other.flowerSmall &&
        isMapEqual(petals, other.petals) &&
        subroute == other.subroute;
}

bool isMapEqual(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
