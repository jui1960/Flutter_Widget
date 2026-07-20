import 'package:expense_tracker/SignUpScreen.dart';
import 'package:expense_tracker/ThemeProvider.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = const Color(0xFF2ECC71);
    final topCardColor = isDark ? Colors.grey.shade900 : primaryColor;
    final backgroundColor = isDark ? Colors.black : Colors.grey.shade50;
    final cardColor = isDark ? Colors.grey.shade900 : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final subTextColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 45, left: 24, right: 24, bottom: 32),
            decoration: BoxDecoration(
              color: topCardColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    Row(
                      children: [
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, child) {
                            return IconButton(
                              icon: Icon(
                                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                                color: Colors.white,
                              ),
                              onPressed: () => themeProvider.toggleTheme(!themeProvider.isDarkMode),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout, color: Colors.white),
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
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  "TODAY IS",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Hello, $userName 👋",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  "THIS MONTH'S SPEND",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "\$313.31",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_downward, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "67% below last month",
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),


          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: cardColor,
                    elevation: isDark ? 0 : 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.account_balance_wallet, color: primaryColor),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "Spending Wallet",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
                          ),
                          const Spacer(),
                          Text(
                            "\$5,631.22",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.chevron_right, color: subTextColor, size: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // রিসেন্ট ট্রানজেকশন হেডার
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RECENT TRANSACTIONS",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: subTextColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("See all", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // ট্রানজেকশন লিস্ট (ডামি ডেটা দিয়ে সাজানো)
                  _buildTransactionItem(
                    icon: Icons.music_note,
                    iconBg: Colors.green.shade100,
                    iconColor: Colors.green.shade800,
                    title: "Spotify Subscriptions",
                    date: "15 July 2026",
                    amount: "-\$4.99",
                    textColor: textColor,
                    subTextColor: subTextColor,
                  ),
                  _buildTransactionItem(
                    icon: Icons.phone_android,
                    iconBg: Colors.blue.shade100,
                    iconColor: Colors.blue.shade800,
                    title: "GoPay Balance Top up",
                    date: "14 July 2026",
                    amount: "-\$11.32",
                    textColor: textColor,
                    subTextColor: subTextColor,
                  ),
                  _buildTransactionItem(
                    icon: Icons.laptop,
                    iconBg: Colors.purple.shade100,
                    iconColor: Colors.purple.shade800,
                    title: "UI8 Subscriptions",
                    date: "12 July 2026",
                    amount: "-\$18.00",
                    textColor: textColor,
                    subTextColor: subTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // মাঝখানের গোল প্লাস (+) বাটন UI অনুযায়ী
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // নতুন খরচ যোগ করার অ্যাকশন এখানে হবে
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // বটম নেভিগেশন বার
      bottomNavigationBar: BottomAppBar(
        color: cardColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.home, color: primaryColor), onPressed: () {}),
              IconButton(icon: Icon(Icons.bar_chart, color: subTextColor), onPressed: () {}),
              const SizedBox(width: 40), // প্লাস বাটনের জন্য ফাঁকা জায়গা
              IconButton(icon: Icon(Icons.repeat, color: subTextColor), onPressed: () {}),
              IconButton(icon: Icon(Icons.person, color: subTextColor), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  // ট্রানজেকশন আইটেম বানানোর কাস্টম উইজেট
  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String date,
    required String amount,
    required Color textColor,
    required Color subTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBg,
            radius: 22,
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
              const SizedBox(height: 4),
              Text(date, style: TextStyle(fontSize: 13, color: subTextColor)),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
          const SizedBox(width: 4),
          Icon(Icons.chevron_right, color: subTextColor, size: 18),
        ],
      ),
    );
  }

  void loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(SignUpScreenState.NAMEKEY) ?? "user";
    setState(() {});
  }
}