import 'package:flutter/material.dart';

void main() {
  runApp(RichTextExample());
}

class RichTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Rich Text Example')),
        body: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey, fontSize: 20),
              children: [
                TextSpan(text: 'Hello '),
                TextSpan(
                  text: 'World !',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(text: ' Flutter use dart language.'),
                TextSpan(
                  text: ' Flutter is a framework',
                  style: TextStyle(
                    fontFamily: 'play',
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
