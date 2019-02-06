import 'package:meta/meta.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

@immutable
class AppState {
  // If these variables are objects, could possibly make more complicated states relatively cleanly...?
  final int number;
  final Map<PetalName, double> flowerProgress;

  AppState({this.number = 0, this.flowerProgress});

  AppState copyWith({
    int number,
    Map flowerProgress,
  }) {
    return AppState(
      number: number ?? this.number,
      flowerProgress: flowerProgress ?? this.flowerProgress,
    );
  }

  static AppState fromJson(dynamic json) {
    //print("json: ${json["flowerProgress"][PetalName.education.toString()].toDouble()}. Its type: ${json["flowerProgress"][PetalName.education.toString()].runtimeType}");

    if (json == null) {
      return null;
    }
    Map<PetalName, double> loadedFlowerProgress = {
      PetalName.education: json["flowerProgress"][PetalName.education.toString()].toDouble(),
      PetalName.community: json["flowerProgress"][PetalName.community.toString()].toDouble(),
      PetalName.job: json["flowerProgress"][PetalName.job.toString()].toDouble(),
      PetalName.income: json["flowerProgress"][PetalName.income.toString()].toDouble(),
      PetalName.housing: json["flowerProgress"][PetalName.housing.toString()].toDouble(),
      PetalName.workLifeBalance: json["flowerProgress"][PetalName.workLifeBalance.toString()].toDouble(),
      PetalName.safety: json["flowerProgress"][PetalName.safety.toString()].toDouble(),
      PetalName.lifeSatisfaction: json["flowerProgress"][PetalName.lifeSatisfaction.toString()].toDouble(),
      PetalName.health: json["flowerProgress"][PetalName.health.toString()].toDouble(),
      PetalName.civicEngagement: json["flowerProgress"][PetalName.civicEngagement.toString()].toDouble(),
      PetalName.environment: json["flowerProgress"][PetalName.environment.toString()].toDouble(),
    };

    return AppState.initial().copyWith(flowerProgress: loadedFlowerProgress);

  }

  dynamic toJson() {
    return {'number': number, 'flowerProgress': {
      PetalName.education.toString(): flowerProgress[PetalName.education],
      PetalName.community.toString(): flowerProgress[PetalName.community],
      PetalName.job.toString(): flowerProgress[PetalName.job],
      PetalName.income.toString(): flowerProgress[PetalName.income],
      PetalName.housing.toString(): flowerProgress[PetalName.housing],
      PetalName.workLifeBalance.toString(): flowerProgress[PetalName.workLifeBalance],
      PetalName.safety.toString(): flowerProgress[PetalName.safety],
      PetalName.lifeSatisfaction.toString(): flowerProgress[PetalName.lifeSatisfaction],
      PetalName.health.toString(): flowerProgress[PetalName.health],
      PetalName.civicEngagement.toString(): flowerProgress[PetalName.civicEngagement],
      PetalName.environment.toString(): flowerProgress[PetalName.environment],
    }};
  }


  // Later on this initial state will be (partially) loaded from system memory
  factory AppState.initial() {
    final double _initialProgress = 50;
    return AppState(
      number: 80,
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
