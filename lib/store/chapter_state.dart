import 'package:meta/meta.dart';

@immutable
class ChapterState {
  final int id;
  final bool read;
  final List<String> foundWords;
  final int maxProgress;

  ChapterState(
      {this.id,
      this.read = false,
      this.foundWords = const [],
      this.maxProgress = 14});

  ChapterState copyWith({
    int id,
    bool read,
    List<String> foundWords,
    double maxProgress,
  }) {
    return ChapterState(
      id: id ?? this.id,
      read: read ?? this.read,
      foundWords: foundWords ?? this.foundWords,
      maxProgress: maxProgress ?? this.maxProgress,
    );
  }

  // 7 points for reading the chapter and 1 for each found word.
  // this has to be changed in the AppState.initial() constructor as well if it
  // is changed here.
  int getChapterProgressAbsolute() {
    int progress = 0;
    if (read) progress += 7;

    progress += foundWords.length;

    return progress > maxProgress ? maxProgress : progress;
  }

  dynamic toJson() {
    return {
      "id": id,
      "read": read,
      "foundWords": foundWords,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterState &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          read == other.read &&
          isListEqual(foundWords, other.foundWords) &&
          maxProgress == other.maxProgress;

  @override
  int get hashCode =>
      id.hashCode ^ read.hashCode ^ foundWords.hashCode ^ maxProgress.hashCode;
}

bool isListEqual(List a, List b) {
  if (a.length != b.length) return false;
  int i = -1;
  return a.every((value) {
    i++;
    return b[i] == value;
  });
}
