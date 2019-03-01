import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_content.dart';

class ChapterScreenBody extends StatelessWidget {
  final Map<String, dynamic> chapter;
  final Petal subject;

  ChapterScreenBody({this.subject, this.chapter});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        converter: (Store<AppState> store) => store
            .state.progress[subject.name].constructProgress[chapter['id']].read,
        builder: (context, read) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 20),
            itemCount: chapter['content'].length +
                2, // +2 to accommodate header/trailer
            separatorBuilder: (context, index) {
              return Container(
                height: 20,
                color: Colors.transparent,
              );
            },
            itemBuilder: (context, index) {
              // Add header and a trailer.
              if (index == 0) {
                return Container(
                  color: Colors.black38,
                  padding: EdgeInsets.all(30),
                  child: Text(
                    chapter['description'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: Colors.white),
                  ),
                );
              } else if (index == chapter['content'].length + 1) {
                return Container(
                  padding: EdgeInsets.only(left: 100, right: 100, bottom: 30),
                  child: StoreConnector<AppState, VoidCallback>(
                      converter: (Store<AppState> store) => () =>
                          store.dispatch(SetChapterAsReadAction(
                              subject.name, chapter['id'])),
                      builder: (BuildContext context, VoidCallback callback) {
                        return RaisedButton(
                          color: Theme.of(context).primaryColor,
                          elevation: 10,
                          shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.only(
                              right: 5, left: 5, top: 10, bottom: 10),
                          onPressed: read
                              ? null
                              : () {
                                  callback();
                                  Navigator.pop(context, true);
                                },
                          child: Text(
                            read ? 'You\'ve already read this chapter' : 'I agree to the te.... I mean I\'ve read this chapter!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.button,
                          ),
                        );
                      }),
                );
              }

              index -= 1;
              return ChapterContent(
                  data: chapter['content'][index], color: subject.color);
            },
          );
        });
  }
}
