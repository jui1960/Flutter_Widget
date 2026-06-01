import 'package:flutter/material.dart';

void main() {
  runApp(const callBackfunstion());
}

class callBackfunstion extends StatelessWidget {
  void callBack() {
    print('Button Clicked');
  }

  const callBackfunstion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CallBackFunction')),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              textStyle: TextStyle(color: Colors.white),
            ),
            onPressed: callBack,
            child: Text('Click me'),
          ),
        ),
      ),
    );
  }
}
