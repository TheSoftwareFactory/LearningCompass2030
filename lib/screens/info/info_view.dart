import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/info/chapter_selection_bar.dart';
import 'package:learning_compass_exp/screens/info/info_body.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

class InfoView extends StatelessWidget {
  final Petal petal;
  final List chapters;

  InfoView({this.petal, this.chapters});

  String _getContent(subroute) {
    final current = chapters.firstWhere((item) => item['title'] == subroute, orElse: () => '');
    if(current == '') {
      return current;
    } else {
      return current['content'].toString();
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
          bottom: new PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: ChapterSelectionBar(subroute,
                chapters.map((chapter) => chapter['title']).toList(),
                _shadedColor(petal.color),
              )
          ),
        ),
        body: InfoBody(subject: petal, content: _getContent(subroute)),
      );
    });
  }
}