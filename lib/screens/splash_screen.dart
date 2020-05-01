import 'package:flutter/material.dart';
import 'package:flametest/screens/main_menu_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash screen')
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            child: Text('Go to main menu'),
            onPressed: (){
              Navigator.pushNamed(context, '/menu');
            },
          )
        ],
      )
    );
  }
}
