import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.videoLink, this.body});

  final String title;
  final String videoLink;
  final Map body;
}




  class AboutTabbedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabbed AppBar'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,

                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
