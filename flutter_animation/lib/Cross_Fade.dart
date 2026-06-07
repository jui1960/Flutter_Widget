import 'package:flutter/material.dart';

import 'Hero_Animation.dart';

class CrossFadeExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CrossFadeExampleState();
}

class _CrossFadeExampleState extends State<CrossFadeExample> {
  bool isFirst = true;

  /* button a click sara automatic fade

  @override

  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      reload();
    });
  }
*/

  void reload() {
    setState(() {
      isFirst = !isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 40, color: Colors.greenAccent),
            ),
            AnimatedCrossFade(
              firstChild: Image.asset(
                'assets/images/android1.png',
                height: 200,
                width: 200,
              ),
              secondChild: Image.asset(
                'assets/images/android.png',

                height: 200,
                width: 200,
              ),
              crossFadeState: isFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 2),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),

              onPressed: () {
                reload();
              },
              child: Text('Animate'),
            ),

            SizedBox(height: 20),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeroAnimationExample(),
                  ),
                );
              },
              child: Text(
                'Go to Hero Animation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
