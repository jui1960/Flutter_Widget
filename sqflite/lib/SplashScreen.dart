import 'dart:async';

import 'package:flutter/material.dart';

import 'homePage.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashscreenState();

}

class _SplashscreenState extends State<Splashscreen>{
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });

  }
  @override
  Widget build(BuildContext context0){
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }

}