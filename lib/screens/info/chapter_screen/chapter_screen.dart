import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_selection_bar.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_screen_body.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

import 'package:learning_compass_exp/services/magic_words_service.dart';

class ChapterScreen extends StatelessWidget {
  final Petal petal;
  final List<dynamic> chapters;

  ChapterScreen({this.petal, this.chapters});

  Map _getContent(subroute) {
    final Map<String, dynamic> current = chapters
        .firstWhere((item) => item['title'] == subroute, orElse: () => Map<String, dynamic>());

    return findMagicWords(_deepCopyChapter(current));
  }

  // Get a darker version of a color
  Color _shadedColor(color) {
    return Color.fromRGBO((color.red * 0.9).round(),
        (color.green * 0.8).round(), (color.blue * 0.8).round(), 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
        converter: (Store<AppState> store) => store.state.subroute,
        builder: (context, subroute) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${petal.toString()}'),
              backgroundColor: petal.color,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40.0),
                  child: ChapterSelectionBar(
                    subroute,
                    chapters.map((chapter) => chapter['title']).toList(),
                    _shadedColor(petal.color),
                  )),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      petal.color.withAlpha(150), BlendMode.color),
                  image: AssetImage(petal.pathToThemeImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: chapters.length == 0 ? Container() : ChapterScreenBody(
                  subject: petal, chapter: _getContent(subroute)),
            ),
          );
        });
  }
}

Map<String, dynamic> _deepCopyChapter(Map<String, dynamic> chapter) {
  if (chapter == null || chapter.length == 0) return chapter;
  Map<String, dynamic> copy = Map<String, dynamic>();
  copy['id'] = chapter['id'];

  String title = chapter['title'];
  String desc = chapter['description'];
  List<Map<String, dynamic>> wordsToFind =
      chapter['wordsToFind'] == null ? List<Map<String, dynamic>>() : List<Map<String, dynamic>>.from(chapter['wordsToFind']);
  List<Map<String, dynamic>> content =
      chapter['content'] == null ? List<Map<String, dynamic>>() : List<Map<String, dynamic>>.from(chapter['content']);

  copy['title'] = title == null ? null :title.substring(0);
  copy['description'] = desc == null ? null : desc.substring(0);
  copy['wordsToFind'] = wordsToFind;
  copy['content'] = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> copyContent = List<Map<String, dynamic>>();
  content.forEach((cont) {
    copyContent.add(
        {"title": cont['title'], "type": cont['type'], "data": cont['data']});
  });

  copy['content'] = copyContent;

  return copy;
}
