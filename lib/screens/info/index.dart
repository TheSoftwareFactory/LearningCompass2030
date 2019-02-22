import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/info/info_view.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

class InfoScreen extends StatelessWidget {
  final PetalName name;

  // These should come from JSON in the future
  final List chapters = [
    {'title': 'Introduction', 'content': 'Here is some info about Introduction to this subject'},
    {'title': 'Outlook on life', 'content': 'Here is some info about Outlook on life in this subject'},
    {'title': 'Life events', 'content': 'Here is some info about Life events in this subject'},
  ];

  InfoScreen({this.name});

  @override
  Widget build(BuildContext context) {
    // the color will be read from the petal constants in the future
    Color _color = Colors.orange[600];
    Future<bool> _willPopCallback(Function onPop) async {
      await onPop();
      return true;
    }

    return StoreConnector<AppState, Function>(
      converter: (Store<AppState> store) {
        return () => store.dispatch(ChangeSubrouteAction(null));
      },
      builder: (context, onPopCallback) {
        return WillPopScope(child: Scaffold(
            appBar: AppBar(
              title: Text('$name'),
              backgroundColor: _color,
            ), body: Center(child: Column(children: [
              Text('add the chapter index/menu here'),
              RaisedButton(
                child: Text('chapter button'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          InfoView(name: name, color: _color, chapters: chapters,)
                      ),
                  );
                },
              ),
        ]),
        ),
        ), onWillPop: () => _willPopCallback(onPopCallback),);
      });
    }
}
