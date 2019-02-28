import 'package:flutter/material.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

class ProgressBar extends StatelessWidget {
  final Petal petal;
  // Progress should be a decimal value in range [0,1]
  final double progress;

  ProgressBar({this.petal, this.progress});

  // returns a percentage while making sure that the given value is in the
  // correct range
  double _currentProgressPercentage(progress) {
    if (progress < 0.0) {
      return 0.0;
    } else if (progress > 1.0) {
      return 1.0 * 100;
    } else {
      return progress * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.5)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.0),
        child: Container(
          height: 20.0,
          width: 200.0,
          color: Colors.grey,
          child: Stack(
            children: <Widget>[
              Container(
                width: _currentProgressPercentage(progress)*2,
                color: petal.color,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${(_currentProgressPercentage(progress)).toStringAsFixed(0)}%',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
