import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignInScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9FE85A),
        elevation: 0,
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            final pref = await SharedPreferences.getInstance();
            if(!mounted) return;
            pref.setBool(SplashScreenState.LOGINKEY, false);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()), (
                    route) => false);
          },
        ),
      ),
    );
  }
}
