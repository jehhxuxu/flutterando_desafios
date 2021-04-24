import 'package:flutter/material.dart';

class KongWidget extends StatefulWidget {
  @override
  _KongWidgetState createState() => _KongWidgetState();
}

class _KongWidgetState extends State<KongWidget> {
  Widget _getImage(bool change) {
    if (change) {
      return Container(
        width: 55,
        height: 64,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sprites/extra/kong.png'),
          ),
        ),
      );
    } else {
      return Container(
        width: 55,
        height: 64,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sprites/extra/kong1.png'),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: 2500),
      duration: const Duration(minutes: 60),
      builder: (BuildContext context, int size, Widget child) {
        var multi = size.isEven ? 2 : 1;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.14 * multi),
          child: _getImage(size.isEven),
        );
      },
    );
  }
}
