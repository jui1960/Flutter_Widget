import 'package:flutter/material.dart';

void main() {
  runApp(const expanded());
}

class expanded extends StatelessWidget {
  const expanded({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: 50,
                color: Colors.amber,
              ),
            ),
            Expanded(
              child: Container(height: 100, width: 50, color: Colors.red),
            ),
            Expanded(
              child: Container(height: 100, width: 50, color: Colors.green),
            ),
            Expanded(
              child: Container(
                height: 100,
                width: 50,
                color: Colors.deepPurple,
              ),
            ),
            Expanded(
              child: Container(height: 100, width: 50, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
