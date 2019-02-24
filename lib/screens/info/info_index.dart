import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/info/chapter_index_card.dart';
import 'package:learning_compass_exp/screens/info/info_view.dart';

// TODO: should be renamed to reflect the fact this is the base of the index page
// for a construct and not specific chapter pages of said construct.
class InfoIndex extends StatelessWidget {
  final Petal subject;

  InfoIndex({this.subject});

  Widget _topTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 40, left: 20, right: 20),
      child: Text(
        subject.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  List _decodeChapters(String data) {
    return json.decode(data)['chapters'];
  }

  void _navigateToInfoView(context, chapters) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
        new InfoView(petal: subject, chapters: chapters),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future:
      DefaultAssetBundle.of(context).loadString(subject.pathToAssetData),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List _chapters = _decodeChapters(snapshot.data)
            ..insert(0, null); // used to leave room for title.
          return Center(
            child: SizedBox(
              width: 400,
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: _chapters.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _topTitle(context);
                  }
                  return ChapterIndexCard(data: _chapters[index],
                      navigateToInfoView: () => _navigateToInfoView(context, _chapters.sublist(1))
                  );
                },
              ),
            ),
          );
        } else {
          return Center(child: Text("Waiting on data..."));
        }
      },
    );
  }
}
