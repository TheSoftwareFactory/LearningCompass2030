import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

class ChapterSelectionBar extends StatelessWidget {
  final String subroute;
  final List chapters;
  final Color shadedColor;

  ChapterSelectionBar(this.subroute, this.chapters, this.shadedColor);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function(String newRoute)>(
        converter: (Store<AppState> store) {
      return (newRoute) {
        store.dispatch(ChangeSubrouteAction(newRoute));
      };
    }, builder: (context, changeRoute) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 30),
        height: 40.0,
        color: shadedColor,
        child: DropdownButtonHideUnderline(
            child: Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: shadedColor, brightness: Brightness.dark),
                child: DropdownButton<String>(
                    elevation: 1,
                    isExpanded: true,
                    value: subroute,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    items: chapters == null ? [DropdownMenuItem<String>(value: 'INVALID', child: Text('No content found'))] : chapters
                        .map((chapter) => DropdownMenuItem<String>(
                            value: chapter, child: Text(chapter)))
                        .toList(),
                    onChanged: (selection) {
                      changeRoute(selection);
                    }))),
      );
    });
  }
}
