import 'package:flutter/material.dart';

class AboutScreenTabBarViewBody extends StatelessWidget {
  const AboutScreenTabBarViewBody({Key key, this.choiceBody}) : super(key: key);
  final Map<String, dynamic> choiceBody;

  _choiceBody(Map<String, dynamic> choiceBody) {
    if (choiceBody['title'] == '') {
      return ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          choiceBody['body'],
        ),
      );
    } else {
      return Column(children: <Widget>[
        ListTile(
          title: Text(choiceBody['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Divider(),
        ListTile(
            contentPadding: EdgeInsets.all(16.0),
            title: Text(choiceBody['body'])),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // About About TabBarView Choice Body Widget
    return Card(color: Colors.white, child: _choiceBody(choiceBody));
  }
}