import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SimpleTweenExample(),
        ),
      ),
    );
  }
}

class SimpleTweenExample extends StatelessWidget {
  const SimpleTweenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 50.0, end: 200.0),

      duration: const Duration(seconds: 2),

      curve: Curves.easeOutBack,

      builder: (BuildContext context, double value, Widget? child) {
        return Container(
          width: value,
          height: value,
          color: Color.lerp(Colors.red, Colors.blue, (value - 50) / 150),
          alignment: Alignment.center,
          child: child,
        );
      },

      child: const Text(
        'Hi!',
        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}