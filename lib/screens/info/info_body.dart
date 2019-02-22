import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/screens/info/chapter_index_card.dart';


// TODO: should be renamed to reflect the fact this is the base of the index page
// for a construct and not specific chapter pages of said construct.
class InfoBody extends StatelessWidget {
  final PetalName subject;

  InfoBody({this.subject});

  Widget _topTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 40, left: 20, right: 20),
      child: Text(
        'Construct name here (i.e. Income etc)',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  List _decodeChapters(String data) {
    return json.decode(data)['chapters'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(
          "assets/static_data/income.json"), // TODO: this will later be specific to this particular screen.
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List _chapters = _decodeChapters(snapshot.data);
          _chapters.insert(0, null); // used to leave room for title.
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
                  return ChapterIndexCard(data: _chapters[index]);
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
