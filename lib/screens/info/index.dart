import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/info/info_body.dart';
import 'package:learning_compass_exp/data/models/petal.dart';


// This Widget defines the root of the Home-screen
class InfoScreen extends StatelessWidget {
  final Petal petal;

  InfoScreen({this.petal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // May separate this into it's own file as well if it gets big
        title: Text('Learning Compass'),
      ),
      body: InfoBody(subject: petal),
    );
  }
}