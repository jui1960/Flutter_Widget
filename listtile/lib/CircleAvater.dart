import 'package:flutter/material.dart';

void main() {
  runApp(const circleAvater());
}

class circleAvater extends StatelessWidget {
  const circleAvater({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Circle Avatar')),
        body: Center(
          child: CircleAvatar(
            child: Container(
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Container(
                    width: 30,
                       height: 30,
                    child: Image.asset('assets/images/and.png'),
                  ),
                  Text('Name',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),),
                ],
              ),
            ),
            backgroundColor: Colors.red,
            maxRadius: 50,
          ),
        ),
      ),
    );
  }
}
