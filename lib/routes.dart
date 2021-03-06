import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about.dart';
import 'package:learning_compass_exp/screens/home/index.dart';
import 'package:learning_compass_exp/screens/construct_info/chapter_index.dart';
import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';


final routes = <String, WidgetBuilder>{
  '/': (context) => HomeScreen(),
  '/income': (context) => InfoScreen(
        petal: PETAL_CONSTANTS.income,
      ),
  '/education': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.education,
  ),
  '/jobs': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.jobs,
  ),
  '/housing': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.housing,
  ),
  '/work_life_balance': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.workLifeBalance,
  ),
  '/safety': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.safety,
  ),
  '/life_satisfaction': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.lifeSatisfaction,
  ),
  '/health': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.health,
  ),
  '/civic_engagement': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.civicEngagement,
  ),
  '/environment': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.environment,
  ),
  '/community': (context) => InfoScreen(
    petal: PETAL_CONSTANTS.community,
  ),

  //Drawer
  '/drawer/about': (context) => About(),
};
