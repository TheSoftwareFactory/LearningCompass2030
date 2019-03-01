import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/tabbed_app_bar/tabbed_bar_choice.dart';

class AboutTabbedAppBar extends StatelessWidget {

  static final _choicesJson = 'assets/static_data/choices.json';
  final List< Map <String, dynamic>> _choices = json.decode(_choicesJson)['choice'];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: _choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('About Learning Compass'),
            bottom: TabBar(
              isScrollable: true,
              tabs: _choices.map((Map <String, dynamic> choice ) {
                return Tab(
                  text: choice ['title'],

                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: _choices.map((Map <String, dynamic> choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceWidget(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}