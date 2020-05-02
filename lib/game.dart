import 'dart:ui';
import 'package:flame/game.dart';

import 'package:flutter/gestures.dart';

class GameScreen extends Game {

  Size screenSize;
  bool hasWon = false;

  final Map<int, Offset> _touches = {};

  void render(Canvas canvas) {
    drawBackground(canvas);
    _touches.values.forEach((_touch){
      drawCircle(canvas, _touch);
    });
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
    bgPaint.color = Color(0xff242424);
    canvas.drawRect(bgRect, bgPaint);
  }

  void drawCircle(Canvas canvas, Offset offset) {
    double radius = 30;
    Paint paint = Paint()..color = const Color(0xFFff007b);

//    drawCircle(canvas, offset);
    canvas.drawCircle(offset, radius, paint);
  }

//  void onTouch(PointerDownEvent event) {
//    print('id: ' + event.pointer.toString() + 'position: '
//        + event.position.dx.toString()
//        + event.position.dy.toString()
//    );
//
//    print('global Position: '
//        + event.localPosition.dx.toString()
//        + event.localPosition.dy.toString()
//    );
//  }

  void onTapDown(int touchId, TapDownDetails d) {
    _touches[touchId] = new Offset(d.globalPosition.dx, d.globalPosition.dy);

//    print(d.globalPosition.dx);
//    print(d.globalPosition.dy);

//    print (touchId);
//
//    double screenCenterX = screenSize.width/2;
//    double screenCenterY = screenSize.height/2;
//    if (d.globalPosition.dx >= screenCenterX - 75
//      && d.globalPosition.dx <= screenCenterX + 75
//      && d.globalPosition.dy >= screenCenterY - 75
//      && d.globalPosition.dy <= screenCenterY + 75
//    ) {
//      print('hit');
//      hasWon = true;
//      print(hasWon);
//    }
  }

  void onTapUp(int touchId, TapUpDetails d) {

    _touches.remove(touchId);
//    print (touchId);

  }

//  void onPanDown(DragDownDetails d) {
//    print('Pan down');
//    print(d.globalPosition.dx);
//    print(d.globalPosition.dy);
//  }
//
//  void onPanUp(DragDownDetails d) {
//    print('pan up');
//    print(d.globalPosition.dx);
//    print(d.globalPosition.dy);
//  }
}
