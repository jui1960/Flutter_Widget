import 'package:flutter/material.dart';

void main() {
  runApp(const RowColumn());
}

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row_Column',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.grey,
            height: 400,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('a'),
                      Text('b'),
                      Text('c'),
                      Text('d'),
                      Text('e'),
                    ],
                  ),
                ),

                Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('a'),
                      Text('b'),
                      Text('c'),
                      Text('d'),
                      Text('e'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
