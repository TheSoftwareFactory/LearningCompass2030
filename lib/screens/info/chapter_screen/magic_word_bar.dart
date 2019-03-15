import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/info/chapter_screen/star_info_dialog.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';
import 'package:learning_compass_exp/data/constants/MISC_CONSTANTS.dart';

class MagicWordBar extends StatelessWidget {
  final Petal petal;
  final ChapterState chapterState;

  MagicWordBar({this.petal, this.chapterState});

  List<Widget> _buildStars() {
    List<Widget> stars = List<Widget>();
    for (int i = 0; i < chapterState.maxProgress - POINTS_FOR_READ; i++) {
      if (i < chapterState.foundWords.length) {
        stars.add(Icon(Icons.star, color: petal.color));
      } else {
        stars.add(Icon(Icons.star_border, color: petal.color));
      }
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: _buildStars(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StarInfoDialog();
                }),
            tooltip: 'What do these stars mean?',
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
