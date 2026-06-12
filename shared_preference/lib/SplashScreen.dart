import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preference/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class Splashsscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<Splashsscreen> {
  static const String KEYLOGIN ='login';
  @override
  void initState() {
    super.initState();
    reLoad();
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

  void reLoad() async {
    var pref = await SharedPreferences.getInstance();
    var isLogIn = pref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLogIn != null) {
        if (isLogIn) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
        }
        else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      }
      else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }
}
