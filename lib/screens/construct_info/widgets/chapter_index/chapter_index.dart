import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_index/chapter_index_card.dart';
import 'package:learning_compass_exp/screens/construct_info/chapter_screen.dart';

class ChapterIndex extends StatelessWidget {
  final Petal subject;
  final List<Map<String, dynamic>> chapters;

  ChapterIndex({this.subject, this.chapters});

  Widget _topTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        color: Colors.black38,
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
        child: Text(
          subject.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void _navigateToInfoView(context, chapters) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChapterScreen(petal: subject, chapters: chapters),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: chapters.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _topTitle(context);
            }
            index -= 1;
            return ChapterIndexCard(
                subject: subject,
                data: chapters[index],
                navigateToInfoView: () =>
                    _navigateToInfoView(context, chapters));
          },
        ),
      ),
    );
  }
}
