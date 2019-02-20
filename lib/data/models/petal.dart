import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

class Petal {
  final Color color;
  final PetalName name;
  final String stringName;
  final double angle;
  final IconData icon;
  final String route;

  Petal({this.color = Colors.brown, @required this.name, @required this.stringName, this.angle = 0.0, this.icon = Icons.error_outline, this.route = '/'});

  Petal copyWith({
    Color color,
    PetalName name,
    String stringName,
    double angle,
    IconData icon,
    String route,
  }) {
    return Petal(
      color: color ?? this.color,
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
              name == other.name &&
              stringName == other.stringName &&
              angle == other.angle &&
              icon == other.icon &&
              route == other.route;
}