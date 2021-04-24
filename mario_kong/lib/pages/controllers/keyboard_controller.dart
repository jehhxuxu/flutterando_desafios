import 'package:flutter/cupertino.dart';

class KeyboardController {
  ValueNotifier<Mario> mario = ValueNotifier(Mario(
      up: 115, isUp: false, isLeft: false, left: 10, steps: 0, img: 'Left'));
  ValueNotifier<int> stepsLeft = ValueNotifier(0);

  KeyboardController();
}

class Mario {
  Mario({
    @required this.isLeft,
    @required this.left,
    @required this.isUp,
    @required this.up,
    @required this.steps,
    @required this.img,
  });

  final bool isLeft;
  final double left;
  final bool isUp;
  final double up;
  final int steps;
  final String img;
}
