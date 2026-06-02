import 'package:flutter/material.dart';

void main() {
  runApp(Position());
}

class Position extends StatelessWidget {
  const Position({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Position Widget')),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey,

          child: Stack(
              children: [
            Positioned(
              top: 100,
              left: 100,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.white),
            )]),
        ),
      ),
    );
  }
}
