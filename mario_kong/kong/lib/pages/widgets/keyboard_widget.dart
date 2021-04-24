import 'package:flutter/material.dart';
import 'package:kong/core/constants/colors.dart';
import 'package:kong/pages/controllers/keyboard_controller.dart';

class KeyboardWidget extends StatefulWidget {
  final KeyboardController keyboardController;

  const KeyboardWidget({Key key, this.keyboardController}) : super(key: key);
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ArrowWidget(
          icon: Icon(Icons.arrow_back),
          keyboardController: widget.keyboardController,
          left: -5,
          up: 0,
          isLeft: false,
          isUp: false,
          imgPath: 'Left',
        ),
        const SizedBox(width: 10),
        ArrowWidget(
          icon: Icon(Icons.arrow_forward),
          keyboardController: widget.keyboardController,
          left: 5,
          up: 0,
          isLeft: true,
          isUp: false,
          imgPath: 'Right',
        ),
        const SizedBox(width: 10),
        ArrowWidget(
          icon: Icon(Icons.arrow_downward),
          keyboardController: widget.keyboardController,
          left: 0,
          up: -5,
          isLeft: false,
          isUp: false,
          imgPath: 'Down',
        ),
        const SizedBox(width: 10),
        ArrowWidget(
          icon: Icon(Icons.arrow_upward),
          keyboardController: widget.keyboardController,
          left: 0,
          up: 5,
          isLeft: false,
          isUp: true,
          imgPath: 'Up',
        ),
      ],
    );
  }
}

class ArrowWidget extends StatefulWidget {
  const ArrowWidget({
    Key key,
    this.icon,
    this.keyboardController,
    this.isLeft,
    this.isUp,
    this.left,
    this.up,
    this.imgPath,
  }) : super(key: key);
  final Icon icon;
  final KeyboardController keyboardController;
  final bool isLeft;
  final bool isUp;
  final double left;
  final double up;
  final String imgPath;

  @override
  _ArrowWidgetState createState() => _ArrowWidgetState();
}

class _ArrowWidgetState extends State<ArrowWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.keyboardController.mario.value = Mario(
            isLeft: widget.isLeft,
            left: widget.keyboardController.mario.value.left + widget.left,
            isUp: widget.isUp,
            up: widget.keyboardController.mario.value.up + widget.up,
            steps: widget.keyboardController.stepsLeft.value == 2
                ? 1
                : widget.keyboardController.stepsLeft.value + 1,
            img: widget.imgPath);
        widget.keyboardController.stepsLeft.value =
            widget.keyboardController.mario.value.steps;
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.darkPink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.icon,
      ),
    );
  }
}
