import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/info/chapter_selection_bar.dart';
import 'package:learning_compass_exp/screens/info/info_body.dart';

class InfoView extends StatelessWidget {
  final PetalName name;
  final Color color;
  final List chapters;

  InfoView({this.name, this.color, this.chapters});

  String _getContent(subroute) {
    final current = chapters.firstWhere((item) => item['title'] == subroute, orElse: () => '');
    if(current == '') {
      return current;
    } else {
      return current['content'];
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
          title: Text('$name'),
          backgroundColor: color,
          bottom: new PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: ChapterSelectionBar(subroute,
                chapters.map((item) => item['title']).toList(),
                _shadedColor(color),
              )
          ),
        ),
        body: InfoBody(subject: name, content: _getContent(subroute)),
      );
    });
  }
}