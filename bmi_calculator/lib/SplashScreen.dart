import 'dart:async';

import 'package:bmi_calculator/WellComeScreen.dart';
import 'package:flutter/material.dart';

class SplashscreenExample extends StatefulWidget {
  @override
  State<SplashscreenExample> createState() => _SplashscreenExampleState();
}

class _SplashscreenExampleState extends State<SplashscreenExample> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wellcomescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.indigo.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img.png',
                width: 200,
                height: 200,
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
