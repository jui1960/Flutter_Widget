import 'package:flutter/material.dart';

void main() {
  runApp(const StackWidget());
}

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Stack Widget')),
        body: Stack(
          children: [
            Positioned(
              top: 2,
              left: 2,
              child: Container(height: 300, width: 300, color: Colors.red),
            ),
            Positioned(
              top: 33,
              left: 33,
              child: Container(height: 200, width: 200, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(height: 100, width: 100, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),),
            ),
            Positioned(
              top: 20,
              right: 200,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
