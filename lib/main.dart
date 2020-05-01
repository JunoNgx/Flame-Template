import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/util.dart';

import 'package:flametest/screens/game_screen.dart';

import 'package:flutter/gestures.dart';

import 'package:flametest/screens/splash_screen.dart';
import 'package:flametest/screens/main_menu_screen.dart';


void main() async {

  GameScreen game = GameScreen();

  runApp(MaterialApp(
    home: SplashScreen(),
    routes: {
      '/splash':(BuildContext context) => SplashScreen(),
      '/menu': (BuildContext context) => MainMenuScreen(),
      '/game': (BuildContext context) => new WillPopScope( // prevent Navigator pop using hardware back button
        onWillPop: () async => false,
        child: game.widget // the actual gameplay screen/widget
      )
    }
  ));

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}