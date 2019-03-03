import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/widgets/grid/grid_item.dart';

import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

class Grid extends StatelessWidget {
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
            children: PETAL_CONSTANTS.toList().map((item) => GridItem(item: item)).toList(),
          ),
        ),

    );
  }
}