import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/screens/info/chapter_screen/word_found_dialog.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

class ChapterContent extends StatelessWidget {
  final Map data;
  final ChapterState chapterState;
  final Color color;
  final Petal petal;

  ChapterContent({this.data, this.chapterState, this.color, this.petal});

  Widget _buildTitle(BuildContext context) {
    if (data['title'] == '') return Container();

    return Text(
      data['title'],
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget _buildTextContent(BuildContext context) {
    String content = data['data'];
    List<dynamic> magicWords = List<dynamic>();
    if (data['magicWords'] != null) {
      magicWords = data['magicWords'];
    }

    List<TextSpan> texts = _splitDataIntoPieces(content, magicWords, 0, context);

    return SizedBox(
      width: 250,
      child: RichText(
        text: TextSpan(
          children: texts,
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context) {
    return Center(child: Text('VIDEO WIDGETS NOT YET IMPLEMENTED'));
  }

  Widget _selectProperBuildContentFunction(BuildContext context) {
    switch (data['type']) {
      case 'text':
        return _buildTextContent(context);
      case 'video':
        return _buildVideoContent(context);

      default:
        return Container();
    }
  }

  /* Unnecessary atm
  Color _getLighterColor(double multiplier) {
    final rinc = 255 - color.red;
    final rtint = rinc * multiplier;

    final ginc = 255 - color.green;
    final gtint = ginc * multiplier;

    final binc = 255 - color.blue;
    final btint = binc * multiplier;
    return Color.fromRGBO(
      color.red + rtint.round(),
      color.green + gtint.round(),
      color.blue + btint.round(),
      1.0,
    );
  }
  */

  List<TextSpan> _splitDataIntoPieces(
      String data, List words, int pointer, BuildContext context) {
    if (words.length == 0) {
      return [TextSpan(text: data.substring(pointer))];
    }

    int index = words.first['index'];
    int wordLength = words.first['word'].length;
    List<TextSpan> dataPieces = [TextSpan(text: data.substring(pointer, index))]
      ..add(TextSpan(
        text: data.substring(index, index + wordLength),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            StoreProvider.of<AppState>(context).dispatch(WordFoundAction(
                petal.name, chapterState.id, words.first['word']));
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return WordFoundDialog(bonusInfo: words.first['bonusInfo'], isWordFound: chapterState.foundWords.contains(words.first['word']),);
                });
          },
      ))
      ..addAll(_splitDataIntoPieces(
          data, words.sublist(1), index + wordLength, context));
    return dataPieces;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: data['type'] == 'video'
          ? EdgeInsets.only(top: 30, bottom: 30)
          : EdgeInsets.all(30),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          _selectProperBuildContentFunction(context),
        ],
      ),
    );
  }
}
