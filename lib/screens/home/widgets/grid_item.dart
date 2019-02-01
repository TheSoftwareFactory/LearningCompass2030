import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final item;

  const GridItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: FlatButton(
        onPressed: () {},
        color: item['color'],
        child: Center(
          child: Text(
            '${item['name']}',
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