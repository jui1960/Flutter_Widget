import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: 40, color: Colors.green),
            ),
            Hero(
              tag: 'android',
              child: Image.asset(
                'assets/images/android.png',
                height: 600,
                width: 600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
