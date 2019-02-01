import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

class Petal {
  final Color color;
  final double progress;
  final PetalName name;

  Petal(this.color, this.progress, this.name);
}