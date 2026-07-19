import 'package:expense_tracker/SignUpScreen.dart';
import 'package:expense_tracker/ThemeProvider.dart'; // 👈 ১. থিম প্রোভাইডার ইম্পোর্ট করা হলো
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈 ২. প্রোভাইডার প্যাকেজ ইম্পোর্ট করা হলো
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard!"),
        actions: [
          // 🌟 ৩. থিম চেঞ্জ করার ম্যাজিক বাটন যোগ করা হলো
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  // ডার্ক মোড হলে চাঁদের আইকন, লাইট মোড হলে সূর্যের আইকন দেখাবে
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
                onPressed: () {
                  // বাটনে ক্লিক করলে ট্রু থাকলে ফলস হবে, ফলস থাকলে ট্রু হবে
                  themeProvider.toggleTheme(!themeProvider.isDarkMode);
                },
              );
            },
          ),

          // আপনার আগের লগআউট বাটনটি যেভাবে ছিল তেমনই আছে
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
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(SignUpScreenState.NAMEKEY) ?? "user";
    setState(() {});
  }
}