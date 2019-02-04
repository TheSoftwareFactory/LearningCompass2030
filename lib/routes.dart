import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/index.dart';
import 'package:learning_compass_exp/screens/info/index.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => HomeScreen(),
  '/income': (context) => InfoScreen(
        name: PetalName.income,
      ),
  '/education': (context) => InfoScreen(
    name: PetalName.education,
  ),
  '/jobs': (context) => InfoScreen(
    name: PetalName.job,
  ),
  '/housing': (context) => InfoScreen(
    name: PetalName.housing,
  ),
  '/work_life_balance': (context) => InfoScreen(
    name: PetalName.workLifeBalance,
  ),
  '/safety': (context) => InfoScreen(
    name: PetalName.safety,
  ),
  '/life_satisfaction': (context) => InfoScreen(
    name: PetalName.lifeSatisfaction,
  ),
  '/health': (context) => InfoScreen(
    name: PetalName.health,
  ),
  '/civic_engagement': (context) => InfoScreen(
    name: PetalName.civicEngagement,
  ),
  '/environment': (context) => InfoScreen(
    name: PetalName.environment,
  ),
  '/community': (context) => InfoScreen(
    name: PetalName.community,
  ),
};
