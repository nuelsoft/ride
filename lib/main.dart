import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:ride/app.dart';
import 'package:ride/auth.dart';
import 'package:ride/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiDE',
      theme: ThemeData(
//        indicatorColor: Colors.purple.shade50,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                borderSide: BorderSide(
                  color: Colors.purple.shade500,
                ))),
        accentColor: Color.fromRGBO(41, 46, 66, 1),
        primaryColor: Colors.purple.shade500,
      ),
      home: Authenticate(),
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      reverse: !Global.isLoggedIn,
        transitionBuilder: (
      Widget child,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return SharedAxisTransition(
        animation: animation,

        secondaryAnimation: secondaryAnimation,
        transitionType: _transitionType,
        child: (Global.isLoggedIn) ? AppMain() : Authenticate(),
      );
    });
  }
}
