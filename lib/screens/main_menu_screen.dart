import 'package:flametest/screens/game_screen.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main menu'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            child: Text('Go to main menu'),
            onPressed: (){
              Navigator.pushNamed(context, '/game');
            },
          )
        ],
      )
    );
  }
}
