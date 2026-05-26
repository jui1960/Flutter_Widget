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

          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Hello, My name is Jannati Akter Jui',
                style: TextStyle(fontFamily: 'PlayFont',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
