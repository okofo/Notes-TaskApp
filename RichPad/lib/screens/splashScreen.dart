import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

import 'homePage.dart';
import 'welcomePage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return false;
  }

  @override
  void initState() {
    super.initState();
    checkSession().then((status) {
      if (status) {
        navigationToWelcome();
      } else {
        navigationToWelcome();
      }
    });
  }

  void navigationToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => MyHomePage(),
      ),
    );
  }

  void navigationToWelcome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25),
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Icon(
                  CupertinoIcons.book,
                  color: Colors.blueGrey,
                  size: 40,
                ),
                Icon(
                  CupertinoIcons.pen,
                  color: Colors.blueGrey,
                  size: 20,
                ),
              ],
            ),
            Material(
              color: Colors.white,
              child: Shimmer.fromColors(
                  child: Text(
                    'RichPad',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 32,
                        fontFamily: 'DancingScript'),
                  ),
                  baseColor: Colors.blueGrey,
                  highlightColor: Colors.amberAccent[100]),
            ),
          ],
        ),
      ),
    );
  }
}
