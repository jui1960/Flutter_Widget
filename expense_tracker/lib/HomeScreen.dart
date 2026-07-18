import 'package:expense_tracker/SignUpScreen.dart';
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

  String userName = "user";

  @override
  void initState() {
    super.initState();
    loadUsername();
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard!"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              await pref.setBool(SplashScreenState.LOGINKEY, false);

              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, $userName 👋",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2ECC71),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Welcome to your Expense Tracker",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadUsername() async{
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(SignUpScreenState.NAMEKEY) ?? "user";
    setState(() {});
  }
}


