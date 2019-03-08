import 'package:flutter/material.dart';


class ChapterContent extends StatelessWidget {
  final Map<String, dynamic> data;
  final Color color;

  ChapterContent({this.data, this.color});

  Widget _buildTitle(BuildContext context) {
    if (data['title'] == '') return Container();

    return Text(
      data['title'],
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Text(
        data['data'],
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context) {
    return Center(
      child: Text('VIDEO WIDGETS NOT YET IMPLEMENTED')
    );
  }

  Widget _buildButtonForCompletion(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        print('This chapter has been read! (remember to add completion)');
        Navigator.pop(context, true);
      },
      child: Text(
        'I have read and understood the.... I mean I\'ve read this chapter!',
        style: Theme.of(context).textTheme.button,
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: data['type'] == 'video'
          ? EdgeInsets.only(top: 30, bottom: 30)
          : EdgeInsets.all(30),
      color: true ? Colors.white : _getLighterColor(0.7),
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          _selectProperBuildContentFunction(context),
        ],
      ),
    );
  }
}
