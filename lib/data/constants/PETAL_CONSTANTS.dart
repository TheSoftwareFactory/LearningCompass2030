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
  final Petal jobs;
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
    this.jobs,
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
      PetalName.jobs: jobs,
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
      jobs,
      income,
      housing
    ];
  }
}

@literal
final _PetalConstants PETAL_CONSTANTS = _PetalConstants(
  workLifeBalance: Petal(
    'Work-Life Balance',
    name: PetalName.workLifeBalance,
    color: Colors.red[900],
    angle: 0.0,
    icon: CustomIcons.workLifeBalance,
    route: '/work_life_balance',
    pathToAssetData: 'assets/static_data/work-life_balance.json',
    pathToThemeImage: 'assets/images/work-life-balance1.jpg',
  ),
  safety: Petal(
    'Safety',
    name: PetalName.safety,
    color: Colors.blueGrey,
    angle: 2 / 11 * pi,
    icon: CustomIcons.safety,
    route: '/safety',
    pathToAssetData: 'assets/static_data/safety.json',
    pathToThemeImage: 'assets/images/safety1.jpg',
  ),
  lifeSatisfaction: Petal(
    'Life Satisfaction',
    name: PetalName.lifeSatisfaction,
    color: Colors.orange[600],
    angle: 4 / 11 * pi,
    icon: CustomIcons.lifeSatisfaction,
    route: '/life_satisfaction',
    pathToAssetData: 'assets/static_data/life_satisfaction.json',
    pathToThemeImage: 'assets/images/life-satisfaction1.jpg',
  ),
  health: Petal(
    'Health',
    name: PetalName.health,
    color: Colors.purple,
    angle: 6 / 11 * pi,
    icon: CustomIcons.health,
    route: '/health',
    pathToAssetData: 'assets/static_data/health.json',
    pathToThemeImage: 'assets/images/health1.jpg',
  ),
  civicEngagement: Petal(
    'Civic Engagement',
    name: PetalName.civicEngagement,
    color: Colors.amber,
    angle: 8 / 11 * pi,
    icon: CustomIcons.civicEngagement,
    route: '/civic_engagement',
    pathToAssetData: 'assets/static_data/civic_engagement.json',
    pathToThemeImage: 'assets/images/civic-engagement1.jpg',
  ),
  environment: Petal(
    'Environment',
    name: PetalName.environment,
    color: Colors.green,
    angle: 10 / 11 * pi,
    icon: CustomIcons.environment,
    route: '/environment',
    pathToAssetData: 'assets/static_data/environment.json',
    pathToThemeImage: 'assets/images/environment1.jpg',
  ),
  education: Petal(
    'Education',
    name: PetalName.education,
    color: Colors.lightGreen[400],
    angle: 12 / 11 * pi,
    icon: CustomIcons.education,
    route: '/education',
    pathToAssetData: 'assets/static_data/education.json',
    pathToThemeImage: 'assets/images/education1.jpg',
  ),
  community: Petal(
    'Community',
    name: PetalName.community,
    color: Colors.red[400],
    angle: 14 / 11 * pi,
    icon: CustomIcons.community,
    route: '/community',
    pathToAssetData: 'assets/static_data/community.json',
    pathToThemeImage: 'assets/images/community1.jpg',
  ),
  jobs: Petal(
    'Jobs',
    name: PetalName.jobs,
    color: Colors.blue,
    angle: 16 / 11 * pi,
    icon: CustomIcons.jobs,
    route: '/jobs',
    pathToAssetData: 'assets/static_data/jobs.json',
    pathToThemeImage: 'assets/images/jobs1.jpg',
  ),
  income: Petal(
    'Income',
    name: PetalName.income,
    color: Colors.cyan,
    angle: 18 / 11 * pi,
    icon: CustomIcons.income,
    route: '/income',
    pathToAssetData: 'assets/static_data/income.json',
    pathToThemeImage: 'assets/images/income1.jpg',
  ),
  housing: Petal(
    'Housing',
    name: PetalName.housing,
    color: Colors.teal[300],
    angle: 20 / 11 * pi,
    icon: CustomIcons.housing,
    route: '/housing',
    pathToAssetData: 'assets/static_data/housing.json',
    pathToThemeImage: 'assets/images/housing1.jpg',
  ),
);
