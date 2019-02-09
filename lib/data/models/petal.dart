import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/constants/petal_attributes.dart';

class Petal {
  final Color color;
  final double progress;
  final PetalName name;
  final double angle;
  final IconData icon;

  Petal({this.color = Colors.brown, this.progress = 50.0, @required this.name, this.angle = 0.0, this.icon = Icons.error_outline});

  Petal copyWith({
    Color color,
    double progress,
    PetalName name,
    double angle,
    IconData icon,
  }) {
    return Petal(
      color: color ?? this.color,
      progress: progress ?? this.progress,
      name: name ?? this.name,
      angle: angle ?? this.angle,
      icon: icon ?? this.icon,
    );
  }

  @override
  int get hashCode =>
      color.hashCode ^
      progress.hashCode ^
      name.hashCode ^
      angle.hashCode ^
      icon.hashCode;


  // Not sure which == for map should be used for this function...
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Petal &&
              runtimeType == other.runtimeType &&
              color == other.color &&
              progress == other.progress &&
              name == other.name &&
              angle == other.angle &&
              icon == other.icon;

  static Petal fromJson(dynamic json) {


    if (json == null) {
      return null;
    }
    print('here too!');
    Map petalDetails = petalAttributes[json["name"]];
    return Petal(
        name: PetalName.values.firstWhere((e) => e.toString() == json["name"]),
        icon: petalAttributes["icon"][json["name"]],
        angle: petalAttributes[json["name"]]["angle"],
        progress: json["progress"] as double,
        color: json["color"] as Color);

  }

  dynamic toJson() {
    print("in Petal toJson");
    return {name.toString(): {"progress": progress}};
  }
}