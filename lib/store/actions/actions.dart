import 'package:learning_compass_exp/data/models/petal_names.dart';

class IncrementNumberAction {}

class SetPetalSizeAction {
  final double petalSize;
  final PetalName petalName;

  SetPetalSizeAction(this.petalSize, this.petalName);
}

class IncrementPetalProgressAction {
  final PetalName petalName;

  IncrementPetalProgressAction(this.petalName);
}

class DecrementPetalProgressAction {
  final PetalName petalName;

  DecrementPetalProgressAction(this.petalName);
}

class ToggleFlowerSmallAction {}

class ChangeSubrouteAction {
  final String subroute;

  ChangeSubrouteAction(this.subroute);
}