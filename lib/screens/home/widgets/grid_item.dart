import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';

class GridItem extends StatelessWidget {
  final Petal item;

  const GridItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, item.route),
        color: item.color,
        child: Center(
          child: Text(
            '${item.stringName}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}