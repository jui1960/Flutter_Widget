import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  var nameFrom;

  MyProfile(this.nameFrom);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome $nameFrom", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black),),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
