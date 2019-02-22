import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/screens/info/info_body.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/info/chapter_selection_bar.dart';
import 'package:learning_compass_exp/store/app_state.dart';

class InfoScreen extends StatelessWidget {
  final PetalName name;

  // These should come from JSON in the future
  final List chapters = [
    {'title': 'Introduction', 'content': 'Here is some info about Introduction to this subject'},
    {'title': 'Outlook on life', 'content': 'Here is some info about Outlook on life in this subject'},
    {'title': 'Life events', 'content': 'Here is some info about Life events in this subject'},
  ];

  InfoScreen({this.name});

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
    // the color will be read from the petal constants in the future
    Color _color = Colors.orange[600];
    return StoreConnector<AppState, String>(
    converter: (Store<AppState> store) => store.state.subroute,
    builder: (context, subroute) {
      return Scaffold(
          appBar: AppBar(
            title: Text('$name'),
            backgroundColor: _color,
            bottom: new PreferredSize(
                preferredSize: const Size.fromHeight(40.0),
                child: ChapterSelectionBar(subroute,
                    chapters.map((item) => item['title']).toList(),
                    _shadedColor(_color),
                )
            ),
          ),
          body: InfoBody(subject: name, content: _getContent(subroute)),
      );
    });
    }
}
