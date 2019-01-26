import 'package:meta/meta.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

@immutable
class AppState {
  // If these variables are objects, could possibly make more complicated states relatively cleanly...?
  final int number;
  final Map<PetalName, double> flowerProgress;

  AppState({this.number, this.flowerProgress});

  AppState copyWith({
    int number,
    Map flowerProgress,
  }) {
    return AppState(
      number: number ?? this.number,
      flowerProgress: flowerProgress ?? this.flowerProgress,
    );
  }

  // Later on this initial state will be (partially) loaded from system memory
  factory AppState.initial() {
    return AppState(
      number: 80,
      flowerProgress: {
        PetalName.education: 30,
        PetalName.community: 30,
        PetalName.job: 30,
        PetalName.income: 30,
        PetalName.housing: 30,
        PetalName.workLifeBalance: 30,
        PetalName.safety: 30,
        PetalName.lifeSatisfaction: 30,
        PetalName.health: 30,
        PetalName.civicEngagement: 30,
        PetalName.environment: 30,
      },
    );
  }
}
