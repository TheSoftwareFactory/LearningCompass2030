import 'package:flutter/material.dart';

class WordFoundDialog extends StatelessWidget {
  final String bonusInfo;
  final bool isWordFound;

  WordFoundDialog({this.bonusInfo, this.isWordFound});

  Widget _buildTop() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(height: 70.0),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isWordFound
                      ? [Colors.white, Colors.black]
                      : [Colors.white, Colors.yellow[700], Colors.black])),
        ),
        Positioned(
          bottom: 0,
          child: _star(50.0),
        ),
      ],
    );
  }

  Widget _star(double size) {
    return Container(
        height: size,
        width: size,
        child: Icon(
          Icons.star,
          size: size,
          color: Colors.yellow[700],
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[800],
        ));
  }

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4,
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Text(
              isWordFound
                  ? "You've already found this word."
                  : "Congratulations, you've just found a Magic Word!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                bonusInfo,
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ],
        ));
  }

  Widget _dismissButton(BuildContext context) {
    return FlatButton(
      child: Text(
        "DISMISS",
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.width * 0.6
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTop(),
          _buildBody(context),
          _dismissButton(context),
        ],
      ),
    ));
  }
}
