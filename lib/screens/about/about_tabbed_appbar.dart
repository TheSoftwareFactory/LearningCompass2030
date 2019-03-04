import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about_tabbarview.dart';
import 'package:learning_compass_exp/screens/about/about_appbar.dart';

class AboutTabbedAppBar extends StatelessWidget {

  static final _choicesJson = 'assets/static_data/choices.json';
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(_choicesJson),
      builder: (context,snapshot){


        if (!snapshot.hasData) {
          return Center(
            child: Text("Loading ....."),
          );
        }

        else {
          var _choices = json.decode(snapshot.data)['choices'];
          print(_choices);

          return DefaultTabController(
            length: _choices.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('About Learning Compass'),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: AboutAppBar(choices: [_choices]),
                ),
              ),
              body: AboutTabBarView(choices: [_choices]),
              ),
            ),
          );
        }

      }

    );


  }


}