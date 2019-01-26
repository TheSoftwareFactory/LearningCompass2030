import 'package:meta/meta.dart';

@immutable
class FlowerState {
  final Map flowerProgress;

  FlowerState({this.flowerProgress});

  FlowerState copyWith({Map flowerProgress}) {
    return FlowerState(
      flowerProgress: flowerProgress ?? this.flowerProgress,
    );
  }

  @override
  int get hashCode =>
      flowerProgress.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowerState &&
      runtimeType == other.runtimeType &&
      flowerProgress == other.flowerProgress;
}
