import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

class ChapterSelectionBar extends StatelessWidget {
  final String subroute;
  final List chapters;

  ChapterSelectionBar(this.subroute, this.chapters);

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
        color: Colors.orange[700],
        child: DropdownButtonHideUnderline(
            child: Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: Colors.orange[700],
                    brightness: Brightness.dark),
                child: DropdownButton<String>(
                    elevation: 1,
                    isExpanded: true,
                    value: subroute,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    items: [
                      DropdownMenuItem<String>(
                          value: 'Introduction', child: Text('Introduction')),
                      DropdownMenuItem<String>(
                          value: 'Outlook on life',
                          child: Text('Outlook on life')),
                      DropdownMenuItem<String>(
                          value: 'Life events', child: Text('Life events')),
                    ],
                    onChanged: (selection) {
                      changeRoute(selection);
                    }
                    )
            )
        ),
      );
    });
  }
}
