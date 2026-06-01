import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var array = [
      Colors.red,
      Colors.grey,
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.pink,
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Grid')),

        body: GridView.count(

          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            Container(color: array[0]),

            Container(color: array[1]),

            Container(color: array[2]),

            Container(color: array[3]),

            Container(color: array[4]),

            Container(color: array[5]),

            Container(color: array[6]),
            Container(color: array[7]),
          ],
        ),
      ),
    );
  }
}
