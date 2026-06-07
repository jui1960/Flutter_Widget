import 'package:flutter/material.dart';

import 'Cross_Fade.dart';

class OpacityExample extends StatefulWidget {
  const OpacityExample({super.key});

  @override
  State<OpacityExample> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  var _Opacity = 1.0;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _Opacity,
              duration: Duration(seconds: 2),
              curve: Curves.bounceOut,
              child: Container(height: 150, width: 150, color: Colors.red),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (flag) {
                  _Opacity = 0.0;
                  flag = false;
                } else {
                  _Opacity = 1.0;
                  flag = true;
                }
                setState(() {});
              },
              child: Text('Animate'),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CrossFadeExample()));
              },
              child: Text('Go to Animated Fade cross..',style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 70),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: 40, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
