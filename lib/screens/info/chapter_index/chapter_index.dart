import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index_card.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_screen.dart';

// TODO: should be renamed to reflect the fact this is the base of the index page
// for a construct and not specific chapter pages of said construct.
class ChapterIndex extends StatelessWidget {
  final Petal subject;

  ChapterIndex({this.subject});

  Widget _topTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        color: Colors.black38,
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
        child: Text(
          subject.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  List _decodeChapters(String data) {
    return json.decode(data)['chapters'];
  }

  void _navigateToInfoView(context, chapters) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChapterScreen(petal: subject, chapters: chapters),
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
                  return ChapterIndexCard(
                      data: _chapters[index],
                      navigateToInfoView: () =>
                          _navigateToInfoView(context, _chapters.sublist(1)));
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
