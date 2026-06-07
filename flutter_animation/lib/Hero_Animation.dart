import 'package:flutter/material.dart';
import 'package:flutter_animation/Hero_Ani_Details.dart';

class HeroAnimationExample extends StatefulWidget {
  @override
  State<HeroAnimationExample> createState() => _HeroAnimationExampleState();
}

class _HeroAnimationExampleState extends State<HeroAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 40, color: Colors.green)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details()),
                  );
                },
                child: Hero(
                  tag: 'android',
                  child: Image.asset(
                    'assets/images/android.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
