import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/services/magic_words_service.dart';

import '../../mock_data.dart';

main() {
  group('Magic Words Service', () {
    group('has public method findMagicWords', () {
      test('that produces the same map but with a magicWords key-value', () {
        Map<String, dynamic> param = MOCK_STATIC_JSON.first['chapters'].first;

        expect(param['content'].first['magicWords'] == null, isTrue);
        expect(findMagicWords(param)['content'].first['magicWords'] == null,
            isFalse);
      });

      test('that produces a map with correct magicWords', () {
        Map<String, dynamic> param = MOCK_STATIC_JSON.first['chapters'].first;
        List resultMagicWords =
            findMagicWords(param)['content'].first['magicWords'];

        expect(resultMagicWords.first['word'], 'some');
        expect(resultMagicWords.first['index'], 0);
        expect(resultMagicWords[1]['word'], 'short');
        expect(resultMagicWords[1]['index'], 5);
      });

      test('that produces a map with an empty list with magicWords', () {
        Map<String, dynamic> param = {
          "id": 1,
          "title": "Introduction",
          "description":
              "Introducing the new and exciting concept of Work-Life Balance",
          "wordsToFind": [
            {"word": "wrong", "bonusInfo": "Some is a word"},
            {"word": "words", "bonusInfo": "short is not a word"},
            {"word": "everywhere", "bonusInfo": "something is wrong."}
          ],
          "content": [
            {"title": "", "type": "text", "data": "some short data here"},
          ]
        };

        Map<String, dynamic> result = findMagicWords(param);

        expect(result['content'].first['magicWords'], null);
      });

      test('that returns correctly when no magic words exist', () {
        Map<String, dynamic> param = {
          "id": 1,
          "title": "Introduction",
          "description":
          "Introducing the new and exciting concept of Work-Life Balance",
          "wordsToFind": [],
          "content": [
            {"title": "", "type": "text", "data": "some short data here"},
          ]
        };

        Map<String, dynamic> result = findMagicWords(param);

        expect(result['content'].first['magicWords'], null);
      });
    });
  });
}
