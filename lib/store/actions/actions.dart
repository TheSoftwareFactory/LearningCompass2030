import 'package:learning_compass_exp/data/models/petal_names.dart';

class IncrementNumberAction {}

class IncrementPetalProgressAction {
  final PetalName petalName;

  IncrementPetalProgressAction(this.petalName);
}

class SetChapterAsReadAction {
  final PetalName constructName;
  final int chapterId;

  SetChapterAsReadAction(this.constructName, this.chapterId);
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
class FirstStartUpDoneAction {}
