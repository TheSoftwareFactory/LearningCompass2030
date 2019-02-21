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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
    converter: (Store<AppState> store) => store.state.subroute,
    builder: (context, subroute) {
      return Scaffold(
          appBar: AppBar(
            title: Text('$name'),
            backgroundColor: Colors.orange,
            bottom: new PreferredSize(
                preferredSize: const Size.fromHeight(40.0),
                child: ChapterSelectionBar(subroute, chapters.map((item) => item['title']).toList())),
          ),
          body: InfoBody(subject: name, content: _getContent(subroute))
      );
    });
    }
}
