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
  final Map<PetalName, Petal> petals;

  AppState({this.number, this.petals});

  AppState copyWith({
    int number,
    Map<PetalName, Petal> petals,
  }) {
    return AppState(
      number: number ?? this.number,
      petals: petals ?? this.petals,
    );
  }

  // Works, but ugly...
  static AppState fromJson(dynamic json) {
    if (json == null || json["petals"] == null) {
      return null;
    }

    AppState initialDefaultState = AppState.initial();
    Map<PetalName, Petal> loadedPetalState = Map<PetalName, Petal>();
    for (Petal petal in initialDefaultState.petals.values) {
      Petal newPetal = petal.copyWith(
          progress: json["petals"][petal.name.toString()]["progress"].toDouble());
      loadedPetalState[newPetal.name] = newPetal;
    }

    return initialDefaultState.copyWith(petals: loadedPetalState);
  }

  // Works, but ugly...
  dynamic toJson() {
    return {
      'petals': {
        PetalName.workLifeBalance.toString(): {
          'progress': petals[PetalName.workLifeBalance].progress
        },
        PetalName.safety.toString(): {
          'progress': petals[PetalName.safety].progress
        },
        PetalName.lifeSatisfaction.toString(): {
          'progress': petals[PetalName.lifeSatisfaction].progress
        },
        PetalName.health.toString(): {
          'progress': petals[PetalName.health].progress
        },
        PetalName.civicEngagement.toString(): {
          'progress': petals[PetalName.civicEngagement].progress
        },
        PetalName.environment.toString(): {
          'progress': petals[PetalName.environment].progress
        },
        PetalName.education.toString(): {
          'progress': petals[PetalName.education].progress
        },
        PetalName.community.toString(): {
          'progress': petals[PetalName.community].progress
        },
        PetalName.job.toString(): {
          'progress': petals[PetalName.job].progress
        },
        PetalName.income.toString(): {
          'progress': petals[PetalName.income].progress
        },
        PetalName.housing.toString(): {
          'progress': petals[PetalName.housing].progress
        },
      }
    };
  }

  // Later on this initial state will be (partially) loaded from system memory
  // This factory constructor might not even be necessary...
  factory AppState.initial() {
    return AppState(
      number: 80,
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
  int get hashCode => number.hashCode ^ petals.hashCode;

  // Not sure which == for map should be used for this function...
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          //petals == other.petals;
          isProgressIdentical(petals, other.petals);
}

bool isProgressIdentical(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
