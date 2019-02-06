import 'package:meta/meta.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

@immutable
class AppState {
  // If these variables are objects, could possibly make more complicated states relatively cleanly...?
  final int number;
  final bool flowerSmall;
  final Map<PetalName, double> flowerProgress;

  AppState({this.number, this.flowerSmall, this.flowerProgress});

  AppState copyWith({
    int number,
    bool flowerSmall,
    Map flowerProgress,
  }) {
    return AppState(
      number: number ?? this.number,
      flowerSmall: flowerSmall ?? this.flowerSmall,
      flowerProgress: flowerProgress ?? this.flowerProgress,
    );
  }


  // Later on this initial state will be (partially) loaded from system memory
  factory AppState.initial() {
    final double _initialProgress = 100;
    return AppState(
      number: 80,
      flowerSmall: true,
      flowerProgress: {
        PetalName.education: _initialProgress,
        PetalName.community: _initialProgress,
        PetalName.job: _initialProgress,
        PetalName.income: _initialProgress,
        PetalName.housing: _initialProgress,
        PetalName.workLifeBalance: _initialProgress,
        PetalName.safety: _initialProgress,
        PetalName.lifeSatisfaction: _initialProgress,
        PetalName.health: _initialProgress,
        PetalName.civicEngagement: _initialProgress,
        PetalName.environment: _initialProgress,
      },
    );
  }

  @override
  int get hashCode =>
      number.hashCode ^
      flowerProgress.hashCode;


  // Not sure which == for map should be used for this function...
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        number == other.number &&
        //flowerProgress == other.flowerProgress;
        isProgressIdentical(flowerProgress, other.flowerProgress);
}

bool isProgressIdentical(Map a, Map b) {
  if (a.length != b.length) return false;
  return a.keys.every((key) => b.containsKey(key) && a[key] == b[key]);
}
