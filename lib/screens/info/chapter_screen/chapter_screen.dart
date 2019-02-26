import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/info/chapter_selection_bar.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_screen_body.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

class ChapterScreen extends StatelessWidget {
  final Petal petal;
  final List<dynamic> chapters;
  final String chapterDescription;

  ChapterScreen({this.petal, this.chapters, this.chapterDescription});

  Map _getContent(subroute) {
    final current = chapters.firstWhere((item) => item['title'] == subroute, orElse: () => []);
    if (current == '') {
      print(current);
      return current;
    } else {
      return current;
    }
  }

  // Get a darker version of a color
  Color _shadedColor(color) {
    return Color.fromRGBO(
        (color.red*0.9).round(),
        (color.green*0.8).round(),
        (color.blue*0.8).round(),
        1.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
    converter: (Store<AppState> store) => store.state.subroute,
    builder: (context, subroute) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${petal.toString()}'),
          backgroundColor: petal.color,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: ChapterSelectionBar(subroute,
                chapters.map((chapter) => chapter['title']).toList(),
                _shadedColor(petal.color),
              )
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(petal.color.withAlpha(150), BlendMode.color),
              image: AssetImage(petal.pathToThemeImage),
              fit: BoxFit.cover,
            ),
          ),
          child: ChapterScreenBody(subject: petal, chapter: _getContent(subroute)),
        ),

      );
    });
  }
}