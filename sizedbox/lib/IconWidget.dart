import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(IconWidget());
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Icon Widget')),
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.flutter_dash,
                size: 100,
                color: Colors.purpleAccent,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              SizedBox(height: 20),
             FaIcon(FontAwesomeIcons.amazon,color : Colors.orange)
            ],
          )

        ),
      ),
    );
  }
}
