import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

class Petal {
  final Color color;
  final double progress;
  final PetalName name;
  final String stringName;
  final double angle;
  final IconData icon;
  final String route;

  Petal({this.color = Colors.brown, this.progress = 50.0, @required this.name, this.stringName, this.angle = 0.0, this.icon = Icons.error_outline, this.route = '/'});

  Petal copyWith({
    Color color,
    double progress,
    PetalName name,
    String stringName,
    double angle,
    IconData icon,
    String route,
  }) {
    return Petal(
      color: color ?? this.color,
      progress: progress ?? this.progress,
      name: name ?? this.name,
      stringName: stringName ?? this.stringName,
      angle: angle ?? this.angle,
      icon: icon ?? this.icon,
      route: route ?? this.route,
    );
  }

  @override
  int get hashCode =>
      color.hashCode ^
      progress.hashCode ^
      name.hashCode ^
      stringName.hashCode ^
      angle.hashCode ^
      icon.hashCode ^
      route.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Petal &&
              runtimeType == other.runtimeType &&
              color == other.color &&
              progress == other.progress &&
              name == other.name &&
              stringName == other.stringName &&
              angle == other.angle &&
              icon == other.icon &&
              route == other.route;

  dynamic toJson() {
    return {
      'name': name.toString(),
      'progress': progress,
    };
  }
}