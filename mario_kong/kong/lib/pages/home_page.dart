import 'package:flutter/material.dart';
import 'package:kong/core/components/lattice/lattice_widget.dart';
import 'package:kong/core/components/stair/stair_bot_widget.dart';
import 'package:kong/core/components/stair/stair_mid_widget.dart';
import 'package:kong/core/components/stair/stair_top_widget.dart';
import 'package:kong/pages/controllers/keyboard_controller.dart';
import 'package:kong/pages/widgets/keyboard_widget.dart';
import 'package:kong/pages/widgets/kong_widget.dart';
import 'package:kong/pages/widgets/princesa_widget.dart';

import 'widgets/mario_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = KeyboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  left: 100,
                  bottom: 20,
                  child: KeyboardWidget(
                    keyboardController: controller,
                  )),
              Positioned(
                bottom: 87,
                child:
                    Row(children: List.generate(9, (index) => LatticeWidget())),
              ),
              Positioned(
                right: 0,
                bottom: 250,
                child:
                    Row(children: List.generate(8, (index) => LatticeWidget())),
              ),
              Positioned(
                top: 211,
                child: Row(
                  children: List.generate(
                    9,
                    (index) => LatticeWidget(),
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 127,
                child: Row(
                  children: List.generate(
                    4,
                    (index) => LatticeWidget(),
                  ),
                ),
              ),
              Positioned(
                left: 177,
                top: 127,
                child: Column(
                  children: [
                    StairTopWidget(),
                  ]
                    ..addAll(
                      List.generate(
                        5,
                        (index) => StairMidWidget(),
                      ),
                    )
                    ..add(StairBotWidget()),
                ),
              ),
              Positioned(
                left: 50,
                top: 44,
                child: Column(children: [
                  StairTopWidget(),
                  ...List.generate(12, (index) => StairMidWidget()),
                  StairBotWidget(),
                ]),
              ),
              Positioned(
                left: 50,
                top: 44,
                child: Column(children: [
                  StairTopWidget(),
                  for (var i = 0; i < 12; i++) ...{
                    StairMidWidget(),
                  },
                  StairBotWidget(),
                ]),
              ),
              Positioned(
                right: 100,
                top: 210,
                child: Column(children: [
                  StairTopWidget(),
                  for (var i = 0; i < 22; i++) ...{
                    StairMidWidget(),
                  },
                  StairBotWidget(),
                ]),
              ),
              Positioned(
                right: 260,
                bottom: 117,
                child: Column(children: [
                  StairTopWidget(),
                  for (var i = 0; i < 12; i++) ...{
                    StairMidWidget(),
                  },
                  StairBotWidget(),
                ]),
              ),
              ValueListenableBuilder<Mario>(
                valueListenable: controller.mario,
                builder: (context, mario, child) {
                  var marioLeft = mario.left;
                  var marioUp = mario.up;

                  if (marioLeft < 0) marioLeft = 0;
                  if (marioUp <= 115) marioUp = 115;

                  var imgPath = _selectImgPath(mario);

                  return MarioWidget(
                    left: marioLeft,
                    up: marioUp,
                    imgPath: imgPath,
                  );
                },
              ),
              Positioned(left: 25, top: 150, child: KongWidget()),
              Positioned(left: 89, top: 69, child: PrincesaWidget()),
            ],
          )),
    );
  }
}

String _selectImgPath(Mario mario) {
  final upDown = mario.img == 'Up' || mario.img == 'Down';
  final leftRight = mario.img == 'Left' || mario.img == 'Right';
  if (leftRight) {
    final img = "mario${mario.img}";
    switch (mario.steps) {
      case 1:
        return "assets/sprites/walk/${img}2.png";
        break;
      case 2:
        return "assets/sprites/walk/${img}1.png";
        break;
      default:
        return "assets/sprites/walk/$img.png";
    }
  }
  if (upDown) {
    final img = "marioStairs";
    switch (mario.steps) {
      case 1:
        return "assets/sprites/stairs/${img}Left.png";
        break;
      case 2:
        return "assets/sprites/stairs/${img}Right.png";
        break;
      default:
        return "assets/sprites/stairs/$img.png";
    }
  }
  return "";
}
