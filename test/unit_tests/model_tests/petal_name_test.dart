import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';

main() {
  group('PetalName', () {
    group('has a method petalNameFromString', () {
      test('that returns correct value when given a valid input', () {
        String input = PetalName.education.toString();

        PetalName result = petalNameFromString(input);

        expect(result, equals(PetalName.education));
      });

      test('that returns null when given a non-valid value', () {
        String input = "soething very very wrong";

        PetalName result = petalNameFromString(input);

        expect(result, null);
      });
    });
  });
}