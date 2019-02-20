import 'package:meta/meta.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

/// This file exports an instance of the below private class [_PetalConstants].
/// Contains all implementation constants needed throughout the app.
/// Might be split into multiple files later if needed.
@immutable
class _PetalConstants {
  final Petal workLifeBalance;
  final Petal safety;
  final Petal lifeSatisfaction;
  final Petal health;
  final Petal civicEngagement;
  final Petal environment;
  final Petal education;
  final Petal community;
  final Petal job;
  final Petal income;
  final Petal housing;

  _PetalConstants({
    this.workLifeBalance,
    this.safety,
    this.lifeSatisfaction,
    this.health,
    this.civicEngagement,
    this.environment,
    this.education,
    this.community,
    this.job,
    this.income,
    this.housing,
  });

  Map<PetalName, Petal> toMap() {
    return {
      PetalName.workLifeBalance: workLifeBalance,
      PetalName.safety: safety,
      PetalName.lifeSatisfaction: lifeSatisfaction,
      PetalName.health: health,
      PetalName.civicEngagement: civicEngagement,
      PetalName.environment: environment,
      PetalName.education: education,
      PetalName.community: community,
      PetalName.job: job,
      PetalName.income: income,
      PetalName.housing: housing,
    };
  }

  List<Petal> toList() {
    return [
      workLifeBalance,
      safety,
      lifeSatisfaction,
      health,
      civicEngagement,
      environment,
      education,
      community,
      job,
      income,
      housing
    ];
  }
}




@literal
final _PetalConstants PETAL_CONSTANTS = _PetalConstants(
  workLifeBalance: Petal(
      name: PetalName.workLifeBalance,
      stringName: 'Work-Life Balance',
      color: Colors.red[900],
      angle: 0.0,
      icon: CustomIcons.workLifeBalance,
      route: '/work_life_balance'),
  safety: Petal(
      name: PetalName.safety,
      stringName: 'Safety',
      color: Colors.blueGrey,
      angle: 2 / 11 * pi,
      icon: CustomIcons.safety,
      route: '/safety'),
  lifeSatisfaction: Petal(
      name: PetalName.lifeSatisfaction,
      stringName: 'Life Satisfaction',
      color: Colors.orange[600],
      angle: 4 / 11 * pi,
      icon: CustomIcons.lifeSatisfaction,
      route: '/life_satisfaction'),
  health: Petal(
      name: PetalName.health,
      stringName: 'Health',
      color: Colors.purple,
      angle: 6 / 11 * pi,
      icon: CustomIcons.health,
      route: '/health'),
  civicEngagement: Petal(
      name: PetalName.civicEngagement,
      stringName: 'Civic Engagement',
      color: Colors.amber,
      angle: 8 / 11 * pi,
      icon: CustomIcons.civicEngagement,
      route: '/civic_engagement'),
  environment: Petal(
      name: PetalName.environment,
      stringName: 'Environment',
      color: Colors.green,
      angle: 10 / 11 * pi,
      icon: CustomIcons.environment,
      route: '/environment'),
  education:  Petal(
      name: PetalName.education,
      stringName: 'Education',
      color: Colors.lightGreen[400],
      angle: 12 / 11 * pi,
      icon: CustomIcons.education,
      route: '/education'),
  community:  Petal(
      name: PetalName.community,
      stringName: 'Community',
      color: Colors.red[400],
      angle: 14 / 11 * pi,
      icon: CustomIcons.community,
      route: '/community'),
  job: Petal(
      name: PetalName.job,
      stringName: 'Job',
      color: Colors.blue,
      angle: 16 / 11 * pi,
      icon: CustomIcons.jobs,
      route: '/job'),
  income: Petal(
      name: PetalName.income,
      stringName: 'Income',
      color: Colors.cyan,
      angle: 18 / 11 * pi,
      icon: CustomIcons.income,
      route: '/income'),
  housing: Petal(
      name: PetalName.housing,
      stringName: 'Housing',
      color: Colors.teal[300],
      angle: 20 / 11 * pi,
      icon: CustomIcons.housing,
      route: '/housing'),
);
