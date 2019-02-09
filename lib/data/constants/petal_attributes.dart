import 'dart:math';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

final petalAttributes = {
  PetalName.workLifeBalance.toString(): {"name": "Work Life Balance", "icon": CustomIcons.workLifeBalance, "color": Colors.red[900], "angle": 0.0},
  PetalName.safety.toString(): {"name": "Safety", "icon": CustomIcons.safety, "color": Colors.blueGrey, "angle": 2 / 11 * pi},
  PetalName.lifeSatisfaction.toString(): {"name": "Life Satisfaction", "icon": CustomIcons.lifeSatisfaction, "color": Colors.orange[600], "angle": 4 / 11 * pi},
  PetalName.health.toString(): {"name": "Health", "icon": CustomIcons.health, "color": Colors.purple, "angle": 6 / 11 * pi},
  PetalName.civicEngagement.toString(): {"name": "Civic Engagement", "icon": CustomIcons.civicEngagement, "color": Colors.amber, "angle": 8 / 11 * pi},
  PetalName.environment.toString(): {"name": "Environment", "icon": CustomIcons.environment, "color": Colors.green, "angle": 10 / 11 * pi},
  PetalName.education.toString(): {"name": "Education", "icon": CustomIcons.education, "color": Colors.lightGreen[400], "angle": 12 / 11 * pi},
  PetalName.community.toString(): {"name": "Community", "icon": CustomIcons.community, "color": Colors.red[400], "angle": 14 / 11 * pi},
  PetalName.job.toString(): {"name": "Job", "icon": CustomIcons.jobs, "color": Colors.blue, "angle": 16 / 11 * pi},
  PetalName.income.toString(): {"name": "Income", "icon": CustomIcons.income, "color": Colors.cyan, "angle": 18 / 11 * pi},
  PetalName.housing.toString(): {"name": "Housing", "icon": CustomIcons.housing, "color": Colors.teal[300], "angle": 20 / 11 * pi},
};