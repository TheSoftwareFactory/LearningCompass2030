class FoundWord {
  final String word;
  final String bonusInfo;
  final int contentId;
  final int startIndex;

  FoundWord({this.word, this.bonusInfo, this.contentId, this.startIndex});
}

Map<String, dynamic> findMagicWords(final Map<String, dynamic> chapter) {
  if (chapter.length == 0) return chapter;
  Map<String, dynamic> chapterCopy = _deepCopyChapter(chapter);
  List<FoundWord> foundWords = _getAllFoundWords(chapterCopy['content'], chapterCopy['wordsToFind']);

  List<dynamic> newContent = _generateNewListOfContentWithMagicWords(chapter['content'], foundWords);

  chapterCopy['content'] = newContent;

  return chapterCopy;
}

List<dynamic> _generateNewListOfContentWithMagicWords(content, foundWords) {
  List<Map<String, dynamic>> newContent = _deepCopyChapterContentList(content);
  List<String> usedWords = List<String>();
  for (FoundWord word in foundWords) {
    if (usedWords.contains(word.word)) continue;
    List<dynamic> magicWords = List<dynamic>();
    if (newContent[word.contentId]['magicWords'] != null &&
        newContent[word.contentId]['magicWords'] is Iterable) {
      magicWords = List.from(newContent[word.contentId]['magicWords']);
    }
    magicWords.add({"word": word.word, "index": word.startIndex, "bonusInfo": word.bonusInfo});
    magicWords.sort((a, b) => a['index'].compareTo(b['index']));
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
  String regExpWord = word['word'];
  //new RegExp("( ${word['word']}[ ,.])")
  List<FoundWord> matches = RegExp("([${regExpWord[0].toLowerCase()}${regExpWord[0].toUpperCase()}]${regExpWord.substring(1)})")
      .allMatches(content['data'])
      .toList()
      .map((match) =>
          FoundWord(word: word['word'], bonusInfo: word['bonusInfo'], contentId: id, startIndex: match.start))
      .toList();
  return matches;
}


Map<String, dynamic> _deepCopyChapter(Map<String, dynamic> chapter) {
  Map<String, dynamic> copy = Map<String, dynamic>();
  copy['id'] = chapter['id'];
  copy['title'] = chapter['title'];
  copy['description'] = chapter['description'];
  List<Map<String, String>> copyWordsToFind = List<Map<String, String>>();
  chapter['wordsToFind'].forEach((word) {
    copyWordsToFind.add({"word": word['word'], "bonusInfo": word['bonusInfo']});
  });
  copy['wordsToFind'] = copyWordsToFind;
  copy['content'] = _deepCopyChapterContentList(chapter['content']);

  return copy;
}

List<Map<String, dynamic>> _deepCopyChapterContentList(List<Map<String, dynamic>> content) {
  List<Map<String, dynamic>> copy = List<Map<String, dynamic>>();
  content.forEach((cont) {
    copy.add({"title": cont['title'], "type": cont['type'], "data": cont['data']});
  });

  return copy;
}
