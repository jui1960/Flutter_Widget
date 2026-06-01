import 'package:flutter/material.dart';

import 'Widget/roundedbtn.dart';

void main() {
  runApp(const CustomWidgetCreate());
}

class CustomWidgetCreate extends StatelessWidget {
  const CustomWidgetCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Widget Create')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: RoundedButton(
                  btnName: 'Play!!',
                  icon: Icon(Icons.play_arrow),
                  callback: () {
                    print('Play button cliked');
                  },
                  textStyle: TextStyle(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 150,
                child: RoundedButton(
                  btnName: 'Login!!',
                  icon: Icon(Icons.login),
                  callback: () {
                    print('Login button cliked');
                  },
                  bgColor: Colors.amber,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
