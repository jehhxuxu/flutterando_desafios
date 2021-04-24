import 'package:flutter/material.dart';

class PrincesaWidget extends StatefulWidget {
  @override
  _PrincesaWidgetState createState() => _PrincesaWidgetState();
}

class _PrincesaWidgetState extends State<PrincesaWidget> {
  Widget _getImage(bool change) {
    if (change) {
      return Container(
        width: 45,
        height: 64,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sprites/extra/princessRight.png'),
          ),
        ),
      );
    } else {
      return Container(
        width: 45,
        height: 64,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sprites/extra/princessLeft.png'),
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
        return _getImage(size.isEven);
      },
    );
  }
}
