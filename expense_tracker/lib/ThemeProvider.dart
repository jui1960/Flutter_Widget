import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  // 🌟 শর্টকাট গেটারটি এখানে মিসিং ছিল, এটিও যোগ করে দিলাম যাতে হোমে ইরর না আসে
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _loadTheme();
  }

  // ১. মেমোরি থেকে থিম লোড করা হচ্ছে
  void _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    // এখানে SplashScreenState.APPTHEME ব্যবহার করছেন
    bool isDark = pref.getBool(SplashScreenState.APPTHEME) ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // ২. থিম চেঞ্জ এবং পার্মানেন্ট সেভ করা হচ্ছে
  void toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    // 🌟 [ফিক্স]: সেভ করার সময়ও হুবহু সেই একই চাবি ব্যবহার করতে হবে!
    await pref.setBool(SplashScreenState.APPTHEME, isDark);
  }
}