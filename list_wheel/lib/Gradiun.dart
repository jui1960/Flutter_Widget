import 'package:flutter/material.dart';

import 'Mapping_List.dart';

class GradiunScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'Lenier gradiun',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_right, size: 50),
              ],

            ),
            SizedBox(height: 40),
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), // Modern soft corners
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffec4899).withOpacity(0.3),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  )
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff8b5cf6),
                    Color(0xffd946ef),
                    Color(0xffec4899),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0], // Kon color koto tuku thakbe
                ),
              ),
            ),            SizedBox(height: 40),
            Text(
              'Radial Gradiun',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color(0xff9890E3), Color(0xffB1F4CF)],

                  center: Alignment.topRight,


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
