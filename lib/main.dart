import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/util.dart';

import 'package:flametest/game.dart';

import 'package:flutter/gestures.dart';

import 'package:flametest/screens/splash_screen.dart';
import 'package:flametest/screens/main_menu_screen.dart';


void main() async {

  GameScreen game = GameScreen();
  Widget gameWidget = new WillPopScope( // prevent Navigator pop using hardware back button
      onWillPop: () async => false,
      child: game.widget // the actual gameplay screen/widget
  );

  runApp(MaterialApp(
//    home: SplashScreen(),
    home: gameWidget,
    routes: {
      '/splash':(BuildContext context) => SplashScreen(),
      '/menu': (BuildContext context) => MainMenuScreen(),
      '/game': (BuildContext context) => gameWidget
    }
  ));

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setPortrait();

  MultiTapGestureRecognizer _tapGestureRecognizer = MultiTapGestureRecognizer();
  _tapGestureRecognizer.onTapDown = game.onTapDown;
  _tapGestureRecognizer.onTapUp = game.onTapUp;
  flameUtil.addGestureRecognizer(_tapGestureRecognizer);

//  ImmediateMultiDragGestureRecognizer _touchRecognizer = ImmediateMultiDragGestureRecognizer();
////  _touchRecognizer.createNewPointerState = game.onTouch;
//  flameUtil.addGestureRecognizer(_touchRecognizer);
}