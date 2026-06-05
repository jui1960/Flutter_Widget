import 'package:flutter/material.dart';
import 'package:navigation_screen/main.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation')),
      body: Column(
        children: [
          Text('Navigate to main page'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text('Click'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
