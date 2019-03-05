import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

class Petal {
  final String _stringName;
  final PetalName name;
  final Color color;
  final double angle;
  final IconData icon;
  final String route;
  final String pathToAssetData;
  final String pathToThemeImage;

  Petal(this._stringName,
      {this.color = Colors.brown,
      @required this.name,
      this.angle = 0.0,
      this.icon = Icons.error_outline,
      this.route = '/',
      this.pathToAssetData,
      this.pathToThemeImage});

  Petal copyWith({
    Color color,
    PetalName name,
    String stringName,
    double angle,
    IconData icon,
    String route,
    String pathToAssetData,
    String pathToThemeImage,
  }) {
    return Petal(
      stringName ?? this._stringName,
      color: color ?? this.color,
      name: name ?? this.name,
      angle: angle ?? this.angle,
      icon: icon ?? this.icon,
      route: route ?? this.route,
      pathToAssetData: pathToThemeImage ?? this.pathToAssetData,
      pathToThemeImage: pathToThemeImage ?? this.pathToThemeImage,
    );
  }

  @override
  int get hashCode =>
      color.hashCode ^
      name.hashCode ^
      _stringName.hashCode ^
      angle.hashCode ^
      icon.hashCode ^
      route.hashCode ^
      pathToAssetData.hashCode ^
      pathToThemeImage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Petal &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          name == other.name &&
          _stringName == other._stringName &&
          angle == other.angle &&
          icon == other.icon &&
          route == other.route &&
          pathToAssetData == other.pathToAssetData &&
          pathToThemeImage == other.pathToThemeImage;

  @override
  String toString() {
    return _stringName;
  }
}
