import 'dart:ui';
import 'package:flame/game.dart';

import 'package:flutter/gestures.dart';

class GameScreen extends Game {

  Size screenSize;
  bool hasWon = false;

  void render(Canvas canvas) {
    drawBackground(canvas);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;

    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150
    );

    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);

  }

  void update(double t) {

  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void drawBackground(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);
  }

  void onTapDown(TapDownDetails tap) {
    print(tap.globalPosition.dx);
    print(tap.globalPosition.dy);

    double screenCenterX = screenSize.width/2;
    double screenCenterY = screenSize.height/2;
    if (tap.globalPosition.dx >= screenCenterX - 75
      && tap.globalPosition.dx <= screenCenterX + 75
      && tap.globalPosition.dy >= screenCenterY - 75
      && tap.globalPosition.dy <= screenCenterY + 75
    ) {
      print('hit');
      hasWon = true;
      print(hasWon);
    }
  }
}
