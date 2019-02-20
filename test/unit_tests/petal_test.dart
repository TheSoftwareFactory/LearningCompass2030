import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

main() {
  group('Petal', () {
    test('creation generates a new instance correctly when given only name',
        () {
      Petal petal = Petal(name: PetalName.lifeSatisfaction, stringName: 'Life Satisfaction');

      expect(petal.name, PetalName.lifeSatisfaction);
      expect(petal.stringName, 'Life Satisfaction');
      expect(petal.angle, 0.0);
      expect(petal.color, Colors.brown);
    });

    test(
        'creation generates a new instance correctly when given specific parameters',
        () {
      Petal petal = Petal(
          name: PetalName.workLifeBalance,
          stringName: 'Work-Life Balance',
          angle: 6.7,
          color: Colors.green);

      expect(petal.name, PetalName.workLifeBalance);
      expect(petal.stringName, 'Work-Life Balance');
      expect(petal.angle, 6.7);
      expect(petal.color, Colors.green);
    });

    test('has an overriden hashCode method that works correctly', () {
      Petal petal = Petal(
          name: PetalName.workLifeBalance,
          stringName: 'Work-Life Balance',
          angle: 6.7,
          color: Colors.green,
          icon: Icons.print);

      int expectedHashCode = PetalName.workLifeBalance.hashCode ^
          'Work-Life Balance'.hashCode ^
          6.7.hashCode ^
          Colors.green.hashCode ^
          Icons.print.hashCode ^
          '/'.hashCode;

      expect(petal.hashCode, expectedHashCode);
    });

    test('has an overriden operator == that works correctly', () {
      Petal firstPetal = Petal(
          name: PetalName.workLifeBalance,
          stringName: 'Work-Life Balance',
          angle: 6.7,
          color: Colors.green);
      Petal secondPetal = Petal(
          name: PetalName.workLifeBalance,
          stringName: 'Work-Life Balance',
          angle: 6.7,
          color: Colors.green);

      expect(identical(firstPetal, secondPetal), isFalse);
      expect(firstPetal, secondPetal);
    });

    test(
        'has a copyWith function that correctly copies another instance creating a new instance',
        () {
      Petal petal = Petal(
          name: PetalName.workLifeBalance,
          stringName: 'Work-Life Balance',
          angle: 6.7,
          color: Colors.green);
      Petal copiedPetal = petal.copyWith();

      expect(identical(petal, copiedPetal), isFalse);
      expect(petal, copiedPetal);
    });

    test(
        'has a copyWith function that correctly copies another instance except given parameters',
        () {
      Petal petal = Petal(
          name: PetalName.workLifeBalance,
          stringName: 'Work-Life Balance',
          angle: 6.7,
          color: Colors.green);
      Petal modifiedPetal =
          petal.copyWith(color: Colors.grey, angle: 90);

      expect(modifiedPetal != petal, true);
      expect(modifiedPetal.color, Colors.grey);
      expect(modifiedPetal.angle, 90);

      expect(petal.angle, 6.7);
      expect(petal.color, Colors.green);
    });
  });
}
