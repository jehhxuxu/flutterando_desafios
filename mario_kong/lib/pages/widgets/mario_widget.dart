import 'package:flutter/material.dart';

class MarioWidget extends StatefulWidget {
  const MarioWidget({Key key, this.left, this.imgPath, this.up})
      : super(key: key);
  final double left;
  final double up;
  final String imgPath;

  @override
  _MarioWidgetState createState() => _MarioWidgetState();
}

class _MarioWidgetState extends State<MarioWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
      left: widget.left,
      bottom: widget.up,
      child: Container(
        width: 33,
        height: 44,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.imgPath),
          ),
        ),
      ),
    );
  }
}
