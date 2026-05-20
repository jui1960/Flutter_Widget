import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Screen"),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Text('a'),
          Text('b'),
          Text('c'),

        ],
      )


    );
  }
}
