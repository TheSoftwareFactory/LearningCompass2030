import 'package:flutter/material.dart';

class StarInfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Find Magic Words!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Find magic words within the text to get extra points and interesting extra information!'),
          Divider(color: Colors.transparent),
          Text('Find a relevant word within the text and tap it to get fun information and a star!'),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Okay, got it!'),
        ),
      ],
    );
  }
}
