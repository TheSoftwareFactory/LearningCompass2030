import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/grid_item.dart';

class Grid extends StatelessWidget {
  // The item data should probably come from somewhere else in the future
  final List _items = [
    { 'name': 'Jobs', 'color': Colors.blue },
    { 'name': 'Income', 'color': Colors.cyan },
    { 'name': 'Housing', 'color': Colors.teal[300] },
    { 'name': 'Work Life Balance', 'color': Colors.red[600] },
    { 'name': 'Safety', 'color': Colors.blueGrey },
    { 'name': 'Life Satisfaction', 'color': Colors.orange[600] },
    { 'name': 'Health', 'color': Colors.purple },
    { 'name': 'Civic Engagement', 'color': Colors.amber },
    { 'name': 'Environment', 'color': Colors.green },
    { 'name': 'Education', 'color': Colors.lightGreen[400] },
    { 'name': 'Community', 'color': Colors.red[400] },
  ];

  @override
  Widget build(BuildContext context) {
    bool _isVertical = MediaQuery.of(context).orientation == Orientation.portrait;
    return Center(
      child:
        SizedBox (
          width: _isVertical ? 350.0 : 525.0,
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: _isVertical ? 2 : 3,
            padding: const EdgeInsets.all(10.0),
            children: _items.map((item) => GridItem(item: item)).toList(),
          ),
        ),

    );
  }
}