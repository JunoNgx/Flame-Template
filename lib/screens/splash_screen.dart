import 'package:flutter/material.dart';
import 'package:flametest/screens/main_menu_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  Animation _animation;
  AnimationController _animationController;
//  final Duration _showingDuration = Duration(milliseconds: 2000);
  final Duration _fadeInDuration = Duration(milliseconds: 4000);

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: _fadeInDuration
    );

//    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//      CurvedAnimation(
//        parent: _animationController,
//        curve: Curves.easeInCirc
//      )
//    );

    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 0.75),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.75),
//      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
//      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 2),
//      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
    ])
      .animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInSine
      ));

    _animationController.forward();
    _animationController.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, '/menu');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reset();
  }

  Widget _buildAnimation(Widget _widget) {
//    Future.delayed(Duration(milliseconds: 500));
    return FadeTransition(
      opacity: _animation,
      child: _widget
    );
//    return ScaleTransition(
//      scale: _animation,
//      child: _widget
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
//      body: Column(
//        children: <Widget>[
//          FlatButton(
//            color: Colors.blue,
//            child: Text('Go to main menu'),
//            onPressed: (){
//              Navigator.pushNamed(context, '/menu');
//            },
//          )
//        ],
//      )
        body: Center(
            child: _buildAnimation(Container(color: Colors.pinkAccent, height: 400, width: 400))
        )
    );
  }
}
