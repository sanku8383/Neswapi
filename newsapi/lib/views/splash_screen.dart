import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapi/views/home_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
// navigate to home screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: Container(
      width: width * 0.6,
      height: width * 0.6,
      child: Image.asset(
        "assets/large_post_4.jpg",
        fit: BoxFit.contain,
      ),
    )));
  }
}