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
        route: '/work_life_balance',
        pathToAssetData: 'assets/static_data/work-life_balance.json',
        pathToThemeImage: 'assets/images/work-life-balance1.jpg',
      );

      expect(PETAL_CONSTANTS.workLifeBalance, expectedValue);
    });

    test('return correct value for Safety', () {
      Petal expectedValue = Petal(
        'Safety',
        name: PetalName.safety,
        color: Colors.blueGrey,
        angle: 2 / 11 * pi,
        icon: CustomIcons.safety,
        route: '/safety',
        pathToAssetData: 'assets/static_data/safety.json',
        pathToThemeImage: 'assets/images/safety1.jpg',
      );

      expect(PETAL_CONSTANTS.safety, expectedValue);
    });

    test('return correct value for Life Satisfaction', () {
      Petal expectedValue = Petal(
        'Life Satisfaction',
        name: PetalName.lifeSatisfaction,
        color: Colors.orange[600],
        angle: 4 / 11 * pi,
        icon: CustomIcons.lifeSatisfaction,
        route: '/life_satisfaction',
        pathToAssetData: 'assets/static_data/life_satisfaction.json',
        pathToThemeImage: 'assets/images/life-satisfaction1.jpg',
      );

      expect(PETAL_CONSTANTS.lifeSatisfaction, expectedValue);
    });

    test('return correct value for Health', () {
      Petal expectedValue = Petal(
        'Health',
        name: PetalName.health,
        color: Colors.purple,
        angle: 6 / 11 * pi,
        icon: CustomIcons.health,
        route: '/health',
        pathToAssetData: 'assets/static_data/health.json',
        pathToThemeImage: 'assets/images/health1.jpg',
      );

      expect(PETAL_CONSTANTS.health, expectedValue);
    });

    test('return correct value for Civic Engagement', () {
      Petal expectedValue = Petal(
        'Civic Engagement',
        name: PetalName.civicEngagement,
        color: Colors.amber,
        angle: 8 / 11 * pi,
        icon: CustomIcons.civicEngagement,
        route: '/civic_engagement',
        pathToAssetData: 'assets/static_data/civic_engagement.json',
        pathToThemeImage: 'assets/images/civic-engagement1.jpg',
      );

      expect(PETAL_CONSTANTS.civicEngagement, expectedValue);
    });

    test('return correct value for Environment', () {
      Petal expectedValue = Petal(
        'Environment',
        name: PetalName.environment,
        color: Colors.green,
        angle: 10 / 11 * pi,
        icon: CustomIcons.environment,
        route: '/environment',
        pathToAssetData: 'assets/static_data/environment.json',
        pathToThemeImage: 'assets/images/environment1.jpg',
      );

      expect(PETAL_CONSTANTS.environment, expectedValue);
    });

    test('return correct value for Education', () {
      Petal expectedValue = Petal(
        'Education',
        name: PetalName.education,
        color: Colors.lightGreen[400],
        angle: 12 / 11 * pi,
        icon: CustomIcons.education,
        route: '/education',
        pathToAssetData: 'assets/static_data/education.json',
        pathToThemeImage: 'assets/images/education1.jpg',
      );

      expect(PETAL_CONSTANTS.education, expectedValue);
    });

    test('return correct value for Community', () {
      Petal expectedValue = Petal(
        'Community',
        name: PetalName.community,
        color: Colors.red[400],
        angle: 14 / 11 * pi,
        icon: CustomIcons.community,
        route: '/community',
        pathToAssetData: 'assets/static_data/community.json',
        pathToThemeImage: 'assets/images/community1.jpg',
      );

      expect(PETAL_CONSTANTS.community, expectedValue);
    });

    test('return correct value for Jobs', () {
      Petal expectedValue = Petal(
        'Jobs',
        name: PetalName.jobs,
        color: Colors.blue,
        angle: 16 / 11 * pi,
        icon: CustomIcons.jobs,
        route: '/jobs',
        pathToAssetData: 'assets/static_data/jobs.json',
        pathToThemeImage: 'assets/images/jobs1.jpg',
      );

      expect(PETAL_CONSTANTS.jobs, expectedValue);
    });

    test('return correct value for Income', () {
      Petal expectedValue = Petal(
        'Income',
        name: PetalName.income,
        color: Colors.cyan,
        angle: 18 / 11 * pi,
        icon: CustomIcons.income,
        route: '/income',
        pathToAssetData: 'assets/static_data/income.json',
        pathToThemeImage: 'assets/images/income1.jpg',
      );

      expect(PETAL_CONSTANTS.income, expectedValue);
    });

    test('return correct value for Housing', () {
      Petal expectedValue = Petal(
        'Housing',
        name: PetalName.housing,
        color: Colors.teal[300],
        angle: 20 / 11 * pi,
        icon: CustomIcons.housing,
        route: '/housing',
        pathToAssetData: 'assets/static_data/housing.json',
        pathToThemeImage: 'assets/images/housing1.jpg',
      );

      expect(PETAL_CONSTANTS.housing, expectedValue);
    });

    test('provides a toList() method that produces a list of petals correctly',
        () {
      Petal oneExpectedValue = Petal('Housing',
          name: PetalName.housing,
          color: Colors.teal[300],
          angle: 20 / 11 * pi,
          icon: CustomIcons.housing,
          route: '/housing',
          pathToAssetData: 'assets/static_data/housing.json',
          pathToThemeImage: 'assets/images/housing1.jpg');

      Petal anotherExpectedValue = Petal('Civic Engagement',
          name: PetalName.civicEngagement,
          color: Colors.amber,
          angle: 8 / 11 * pi,
          icon: CustomIcons.civicEngagement,
          route: '/civic_engagement',
          pathToAssetData: 'assets/static_data/civic_engagement.json',
          pathToThemeImage: 'assets/images/civic-engagement1.jpg');

      expect(PETAL_CONSTANTS.toList() is List<Petal>, isTrue);
      expect(PETAL_CONSTANTS.toList()[10], oneExpectedValue);
      expect(PETAL_CONSTANTS.toList()[4], anotherExpectedValue);
    });

    test('provides a toMap() method that produces a map of petals correctly',
        () {
      Petal oneExpectedValue = Petal('Housing',
          name: PetalName.housing,
          color: Colors.teal[300],
          angle: 20 / 11 * pi,
          icon: CustomIcons.housing,
          route: '/housing',
          pathToAssetData: 'assets/static_data/housing.json',
          pathToThemeImage: 'assets/images/housing1.jpg');

      Petal anotherExpectedValue = Petal('Civic Engagement',
          name: PetalName.civicEngagement,
          color: Colors.amber,
          angle: 8 / 11 * pi,
          icon: CustomIcons.civicEngagement,
          route: '/civic_engagement',
          pathToAssetData: 'assets/static_data/civic_engagement.json',
          pathToThemeImage: 'assets/images/civic-engagement1.jpg');

      expect(PETAL_CONSTANTS.toMap() is Map<PetalName, Petal>, isTrue);
      expect(PETAL_CONSTANTS.toMap()[PetalName.housing], oneExpectedValue);
      expect(PETAL_CONSTANTS.toMap()[PetalName.civicEngagement],
          anotherExpectedValue);
    });
  });
}
