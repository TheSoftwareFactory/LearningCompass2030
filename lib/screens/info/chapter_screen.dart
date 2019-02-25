import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/info/info_body.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

// This Widget defines the root of the Home-screen
class ChapterScreen extends StatelessWidget {
  final Map data;

  ChapterScreen({this.data});

  List<Widget> _buildContent() {
    List contents = data['content'];
    return contents.map((content) {
      switch (content['type']) {
        case 'text':
          {
            return Text(content['data']);
          }
        break;

        default: {
          return Text('Default text');
        }
        break;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // May separate this into it's own file as well if it gets big
        title: Text('Learning Compass'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(),
            ]..addAll(_buildContent()),
          ),
        ],
      ),
    );
  }
}
