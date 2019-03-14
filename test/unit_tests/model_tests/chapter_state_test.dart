import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/data/models/chapter_state.dart';

main() {
  group('ChapterState', () {
    test('has correct default values', (){
      ChapterState cState = ChapterState();

      expect(cState.read, isFalse);
      expect(cState.foundWords, []);
      expect(cState.maxProgress, 7);
    });

    test('saves parameters correctly', () {
      ChapterState cState = ChapterState(id: 69, read: true, foundWords: ['fdifdsa'], maxProgress: 89);

      expect(cState.id, 69);
      expect(cState.read, isTrue);
      expect(cState.foundWords, ['fdifdsa']);
      expect(cState.maxProgress, 89);
    });

    group('has copyWith method', () {
      test('that copies instance correctly', () {
        ChapterState cState = ChapterState(id: 69, read: true, foundWords: ['fdifdsa'], maxProgress: 89);
        ChapterState copied = cState.copyWith();

        expect(identical(cState, copied), isFalse);
        expect(copied == cState, isTrue);
      });

      test('that copies instance correctly except given values', () {
        ChapterState cState = ChapterState(id: 69, read: true, foundWords: ['fdifdsa'], maxProgress: 89);
        ChapterState copied = cState.copyWith(foundWords: ['fddfadfsdfs', 'ojhug']);

        ChapterState expectedState = ChapterState(id: 69, read: true, foundWords: ['fddfadfsdfs', 'ojhug'], maxProgress: 89);

        expect(identical(cState, copied), isFalse);
        expect(copied == cState, isFalse);
        expect(copied == expectedState, isTrue);
      });
    });

    group('has getChapterProgressAbsolute method', () {
      test('that returns correct value when read status is true', () {
        ChapterState cState = ChapterState(id: 69, read: true, foundWords: [], maxProgress: 89);

        expect(cState.getChapterProgressAbsolute(), 7);
      });

      test('that returns correect value when read status is false', () {
        ChapterState cState = ChapterState(id: 69, read: false, foundWords: [], maxProgress: 89);

        expect(cState.getChapterProgressAbsolute(), 0);
      });

      test('that returns correct value when foundWords exist', () {
        ChapterState cState = ChapterState(id: 69, read: false, foundWords: ['first', 'second'], maxProgress: 89);

        expect(cState.getChapterProgressAbsolute(), 2);
      });
    });

    group('has toJson method', () {
      test('that returns correctly when given no chapters', () {
        ChapterState cState = ChapterState(id: 69, read: true, foundWords: ['asdf'], maxProgress: 34);

        expect(cState.toJson(), {
          "id": 69,
          "read": true,
          "foundWords": ['asdf']
        });
      });
    });

    group('has overriden ==operator', () {
      test('that works on equal items', () {
        ChapterState cState1 = ChapterState(id: 69, read: false, foundWords: ['first', 'second'], maxProgress: 89);
        ChapterState cState2 = ChapterState(id: 69, read: false, foundWords: ['first', 'second'], maxProgress: 89);

        expect(cState1 == cState2, isTrue);
      });

      test('that works on unqual items', () {
        ChapterState cState1 = ChapterState(id: 69, read: false, foundWords: ['first', 'second'], maxProgress: 89);
        ChapterState cState2 = ChapterState(id: 69, read: false, foundWords: ['first'], maxProgress: 89);

        expect(cState1 == cState2, isFalse);
      });
    });
  });
}