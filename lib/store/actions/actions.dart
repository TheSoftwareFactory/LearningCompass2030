import 'package:learning_compass_exp/data/models/petal_names.dart';

class SetChapterAsReadAction {
  final PetalName constructName;
  final int chapterId;

  SetChapterAsReadAction(this.constructName, this.chapterId);
}

class ToggleFlowerSmallAction {}

class ChangeSubrouteAction {
  final String subroute;

  ChangeSubrouteAction(this.subroute);
}

class FirstStartUpDoneAction {}
