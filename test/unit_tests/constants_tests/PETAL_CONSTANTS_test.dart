import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

main() {
  group('PETAL CONSTANTS', () {
    test('return correct value for Work-Life Balance', () {
      Petal expectedValue = Petal(
          'Work-Life Balance',
          name: PetalName.workLifeBalance,
          color: Colors.red[900],
          angle: 0.0,
          icon: CustomIcons.workLifeBalance,
          route: '/work_life_balance');

      expect(PETAL_CONSTANTS.workLifeBalance, expectedValue);
    });

    test('return correct value for Safety', () {
      Petal expectedValue = Petal(
          'Safety',
          name: PetalName.safety,
          color: Colors.blueGrey,
          angle: 2 / 11 * pi,
          icon: CustomIcons.safety,
          route: '/safety');

      expect(PETAL_CONSTANTS.safety, expectedValue);
    });

    test('return correct value for Life Satisfaction', () {
      Petal expectedValue = Petal(
          'Life Satisfaction',
          name: PetalName.lifeSatisfaction,
          color: Colors.orange[600],
          angle: 4 / 11 * pi,
          icon: CustomIcons.lifeSatisfaction,
          route: '/life_satisfaction');

      expect(PETAL_CONSTANTS.lifeSatisfaction, expectedValue);
    });

    test('return correct value for Health', () {
      Petal expectedValue = Petal(
          'Health',
          name: PetalName.health,
          color: Colors.purple,
          angle: 6 / 11 * pi,
          icon: CustomIcons.health,
          route: '/health');

      expect(PETAL_CONSTANTS.health, expectedValue);
    });

    test('return correct value for Civic Engagement', () {
      Petal expectedValue = Petal(
          'Civic Engagement',
          name: PetalName.civicEngagement,
          color: Colors.amber,
          angle: 8 / 11 * pi,
          icon: CustomIcons.civicEngagement,
          route: '/civic_engagement');

      expect(PETAL_CONSTANTS.civicEngagement, expectedValue);
    });

    test('return correct value for Environment', () {
      Petal expectedValue = Petal(
          'Environment',
          name: PetalName.environment,
          color: Colors.green,
          angle: 10 / 11 * pi,
          icon: CustomIcons.environment,
          route: '/environment');

      expect(PETAL_CONSTANTS.environment, expectedValue);
    });

    test('return correct value for Education', () {
      Petal expectedValue = Petal(
          'Education',
          name: PetalName.education,
          color: Colors.lightGreen[400],
          angle: 12 / 11 * pi,
          icon: CustomIcons.education,
          route: '/education');

      expect(PETAL_CONSTANTS.education, expectedValue);
    });

    test('return correct value for Community', () {
      Petal expectedValue = Petal(
          'Community',
          name: PetalName.community,
          color: Colors.red[400],
          angle: 14 / 11 * pi,
          icon: CustomIcons.community,
          route: '/community');

      expect(PETAL_CONSTANTS.community, expectedValue);
    });

    test('return correct value for Job', () {
      Petal expectedValue = Petal(
          'Job',
          name: PetalName.job,
          color: Colors.blue,
          angle: 16 / 11 * pi,
          icon: CustomIcons.jobs,
          route: '/job');

      expect(PETAL_CONSTANTS.job, expectedValue);
    });

    test('return correct value for Income', () {
      Petal expectedValue = Petal(
          'Income',
          name: PetalName.income,
          color: Colors.cyan,
          angle: 18 / 11 * pi,
          icon: CustomIcons.income,
          route: '/income');

      expect(PETAL_CONSTANTS.income, expectedValue);
    });

    test('return correct value for Housing', () {
      Petal expectedValue = Petal(
          'Housing',
          name: PetalName.housing,
          color: Colors.teal[300],
          angle: 20 / 11 * pi,
          icon: CustomIcons.housing,
          route: '/housing');

      expect(PETAL_CONSTANTS.housing, expectedValue);
    });

    test('provides a toList() method that produces a list of petals correctly', () {
      Petal oneExpectedValue = Petal(
          'Housing',
          name: PetalName.housing,
          color: Colors.teal[300],
          angle: 20 / 11 * pi,
          icon: CustomIcons.housing,
          route: '/housing');

      Petal anotherExpectedValue = Petal(
          'Civic Engagement',
          name: PetalName.civicEngagement,
          color: Colors.amber,
          angle: 8 / 11 * pi,
          icon: CustomIcons.civicEngagement,
          route: '/civic_engagement');

      expect(PETAL_CONSTANTS.toList() is List<Petal>, isTrue);
      expect(PETAL_CONSTANTS.toList()[10], oneExpectedValue);
      expect(PETAL_CONSTANTS.toList()[4], anotherExpectedValue);
    });

    test('provides a toMap() method that produces a map of petals correctly', () {
      Petal oneExpectedValue = Petal(
          'Housing',
          name: PetalName.housing,
          color: Colors.teal[300],
          angle: 20 / 11 * pi,
          icon: CustomIcons.housing,
          route: '/housing');

      Petal anotherExpectedValue = Petal(
          'Civic Engagement',
          name: PetalName.civicEngagement,
          color: Colors.amber,
          angle: 8 / 11 * pi,
          icon: CustomIcons.civicEngagement,
          route: '/civic_engagement');

      expect(PETAL_CONSTANTS.toMap() is Map<PetalName, Petal>, isTrue);
      expect(PETAL_CONSTANTS.toMap()[PetalName.housing], oneExpectedValue);
      expect(PETAL_CONSTANTS.toMap()[PetalName.civicEngagement], anotherExpectedValue);
    });
  });
}
