import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/LoginScreen.dart';

class Splashsscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashsscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/img_1.png', width: 100, height: 100),
        SizedBox(height: 20),
        Text('Splash Screen', style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan),),
      ],
    )));
  }
}
