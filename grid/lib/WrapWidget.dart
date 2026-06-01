import 'package:flutter/material.dart';

void main() {
  runApp(const WrapWidget());
}

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Wrap Widget')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,

            children: [
              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.amber),
              Container(width: 100, height: 100, color: Colors.indigoAccent),
              Container(width: 100, height: 100, color: Colors.indigo),
              Container(width: 100, height: 100, color: Colors.yellowAccent),
              Container(width: 100, height: 100, color: Colors.green),

              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.amber),
              Container(width: 100, height: 100, color: Colors.indigoAccent),
              Container(width: 100, height: 100, color: Colors.indigo),
            ],
          ),
        ),
      ),
    );
  }
}
