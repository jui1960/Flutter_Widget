import 'package:flutter/material.dart';

void main() {
  runApp(Map());
}

class Map extends StatelessWidget {
  var array = [
    'jui',
    'jesika',
    'jemi',
    'jia',
    'anika',
    'medha',
    'josim',
    'jui',
    'jesika',
    'jemi',
    'jia',
    'anika',
    'medha',
    'josim',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            children: array.map((value) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(value),
                  subtitle: Text('subtitle'),
                  trailing: CircleAvatar(child: Icon(Icons.add)),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
