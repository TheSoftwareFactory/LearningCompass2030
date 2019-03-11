class FoundWord {
  final String word;
  final String bonusInfo;
  final int contentId;
  final int startIndex;

  FoundWord({this.word, this.bonusInfo, this.contentId, this.startIndex});
}

Map<String, dynamic> findMagicWords(final Map<String, dynamic> chapter) {
  List<FoundWord> foundWords = _getAllFoundWords(chapter['content'], chapter['wordsToFind']);

  List<dynamic> newContent = _generateNewListOfContentWithMagicWords(chapter['content'], foundWords);

  Map<String, dynamic> updatedChapter = Map.from(chapter);
  updatedChapter['content'] = newContent;

  return updatedChapter;
}

List<dynamic> _generateNewListOfContentWithMagicWords(content, foundWords) {
  List<dynamic> newContent = List.from(content);
  List<String> usedWords = List<String>();
  for (FoundWord word in foundWords) {
    if (usedWords.contains(word.word)) continue;
    List<dynamic> magicWords = List<dynamic>();
    if (newContent[word.contentId]['magicWords'] != null &&
        newContent[word.contentId]['magicWords'] is Iterable) {
      magicWords = List.from(newContent[word.contentId]['magicWords']);
    }
    magicWords.add({"word": word.word, "index": word.startIndex, "bonusInfo": word.bonusInfo});
    newContent[word.contentId]['magicWords'] = magicWords; // bad things....?

    usedWords.add(word.word);
  }

  return newContent;
}

List<FoundWord> _getAllFoundWords(List content, List<Map<String, dynamic>> wordsToFind) {
  List<FoundWord> foundWords = new List<FoundWord>();
  for (int i = 0; i < content.length; i++) {
    for (Map<String, dynamic> magicWord in wordsToFind) {
      foundWords.addAll(_findWord(magicWord, i, content[i]));
    }
  }
  foundWords.shuffle();

  return foundWords;
}

List<FoundWord> _findWord(Map word, int id, Map content) {
  List<FoundWord> matches = new RegExp("( ${word['word']}[ ,.])")
      .allMatches(content['data'])
      .toList()
      .map((match) =>
          FoundWord(word: word['word'], bonusInfo: word['bonusInfo'], contentId: id, startIndex: match.start))
      .toList();
  return matches;
}
