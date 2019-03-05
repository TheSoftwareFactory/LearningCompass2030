import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/data/models/construct_progress_state.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';

main() {
  group('ConstructProgressState', () {
    test('saves parameters correctly', () {
      ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});

      expect(cpState.id, 69);
      expect(cpState.constructProgress, {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});
    });

    group('has copyWith method', () {
      test('that copies instance correctly', () {
        ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});
        ConstructProgressState copied = cpState.copyWith();

        expect(identical(cpState, copied), isFalse);
        expect(copied == cpState, isTrue);
      });

      test('that copies instance correctly except given values', () {
        ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});
        ConstructProgressState copied = cpState.copyWith(constructProgress: {7: ChapterState(id: 8, maxProgress: 45, foundWords: [], read: false)});

        ConstructProgressState expectedState = ConstructProgressState(id: 69, constructProgress: {7: ChapterState(id: 8, maxProgress: 45, foundWords: [], read: false)});

        expect(identical(cpState, copied), isFalse);
        expect(copied == cpState, isFalse);
        expect(copied == expectedState, isTrue);
      });
    });

    group('has getConstructProgressPerCent method', () {
      test('that returns correct value when no chapters exist', () {
        ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress: {});

        expect(cpState.getConstructProgressPerCent(), 0.0);
      });

      test('that returns correct value when chapters exist', () {
        ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress:
          {
            4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true),
            6: ChapterState(id: 34, maxProgress: 34, read: true),
          });

        expect(cpState.getConstructProgressPerCent(), 15 / 90);
      });
    });

    group('has toJson method', () {
      test('that returns correctly when given no chapters', () {
        ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress: {});

        expect(cpState.toJson(), {"id": 69, "constructProgress": {}});
      });

      test('that returns correct value when given chapters', () {
        ConstructProgressState cpState = ConstructProgressState(id: 69, constructProgress: {
          4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true),
          6: ChapterState(id: 23, maxProgress: 23, foundWords: [], read: false),
        });

        expect(cpState.toJson(), {
          "id": 69,
          "constructProgress": {
            '4': {"id": 56, "read": true, "foundWords": ["adsf"]},
            '6': {"id": 23, "read": false, "foundWords": []}
          }
        });
      });
    });

    group('has overriden ==operator', () {
      test('that works on equal items', () {
        ConstructProgressState cpState1 = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});
        ConstructProgressState cpState2 = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});

        expect(cpState1 == cpState2, isTrue);
      });

      test('that works on unqual items', () {
        ConstructProgressState cpState1 = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: false)});
        ConstructProgressState cpState2 = ConstructProgressState(id: 69, constructProgress: {4: ChapterState(id: 56, maxProgress: 56, foundWords: ['adsf'], read: true)});

        expect(cpState1 == cpState2, isFalse);
      });
    });
  });
}