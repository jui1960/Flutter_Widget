import 'package:flutter/material.dart';
import 'package:navigation_screen/SplashScreen.dart';

import 'Profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash(), debugShowCheckedModeBanner: false);
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var NameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DashBoard'),
              SizedBox(height: 20),
              TextField(
                controller: NameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),

              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(builder: (context) => MyProfile(NameController.text.toString())),
                  );
                },
                child: Text('Go to profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
