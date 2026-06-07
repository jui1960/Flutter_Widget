import 'package:flutter/material.dart';

import 'Animated_Opecity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _height = 100.0;
  var _width = 200.0;
  bool flag = true;
  Color bgColor = Colors.red;
  BorderRadius _borderRadius = BorderRadius.circular(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              height: _height,
              width: _width,
              curve: Curves.bounceOut,

              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: bgColor,
              ),
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
                  flag = false;
                  _height = 100.0;
                  _width = 200.0;
                  bgColor = Colors.red;
                  _borderRadius = BorderRadius.circular(6);
                } else {
                  _height = 200.0;
                  _width = 100.0;
                  flag = true;
                  bgColor = Colors.blue;
                  _borderRadius = BorderRadius.circular(20);
                }

                setState(() {});
              },
              child: Text('Animate'),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>OpacityExample()));

              },
              child: Text(
                'Go to Animated Opecity..',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
