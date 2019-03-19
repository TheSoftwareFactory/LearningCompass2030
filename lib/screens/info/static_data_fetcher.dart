import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';

import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index.dart';

class StaticDataFetcher extends StatelessWidget {
  final Petal subject;

  StaticDataFetcher({this.subject});

  List<Map<String, dynamic>> _decodeChapters(String data) {
    var chapters = json.decode(data)['chapters'];
    return chapters == null
        ? List<Map<String, dynamic>>()
        : List<Map<String, dynamic>>.from(json.decode(data)['chapters']);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(subject.pathToAssetData),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ChapterIndex(
            subject: subject,
            chapters: _decodeChapters(snapshot.data),
          );
        } else {
          return Center(child: Text("Waiting on data..."));
        }
      },
    );
  }
}
