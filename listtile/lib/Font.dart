import 'package:flutter/material.dart';

void main() {
  runApp(const font());
}

class font extends StatelessWidget {
  const font({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Font')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hello, My name is Jannati Akter Jui',
              style: TextStyle(fontFamily: 'PlayFont',fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
