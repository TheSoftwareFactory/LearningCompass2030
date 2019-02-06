import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

class Petal {
  final Color color;
  final double progress;
  final PetalName name;
  final double angle;

  Petal({this.color = Colors.brown, this.progress = 50.0, @required this.name, this.angle = 0.0});

  Petal copyWith({
    Color color,
    double progress,
    PetalName name,
    double angle,
  }) {
    return Petal(
      color: color ?? this.color,
      progress: progress ?? this.progress,
      name: name ?? this.name,
      angle: angle ?? this.angle,
    );
  }

  @override
  int get hashCode =>
      color.hashCode ^
      progress.hashCode ^
      name.hashCode ^
      angle.hashCode;


  // Not sure which == for map should be used for this function...
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Petal &&
              runtimeType == other.runtimeType &&
              color == other.color &&
              progress == other.progress &&
              name == other.name &&
              angle == other.angle;
}