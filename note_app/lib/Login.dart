import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pref = await SharedPreferences.getInstance();
  bool isLogin = pref.getBool(LoginState.LOGIN_KEY) ?? false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin ? Homescreen() : Login(),
    ),
  );
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  static const String LOGIN_KEY = 'login';
  static const String USER_NAME = 'user_name';

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lock_person_rounded, size: 60, color: Colors.teal),
              ),
              const SizedBox(height: 15),
              const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)
              ),
              const Text(
                  'Sign in to access your notes',
                  style: TextStyle(fontSize: 14, color: Colors.grey)
              ),
              const SizedBox(height: 40),


              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.teal),
                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.teal),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: isPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.teal),
                  prefixIcon: const Icon(Icons.lock_outlined, color: Colors.teal),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 35),

              // ৫. গ্রিন গ্রেডিয়েন্ট লগইন বাটন
              GestureDetector(
                onTap: () async {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();
                  String userName = email.split('@')[0];

                  if (email.isNotEmpty && password.isNotEmpty) {
                    var pref = await SharedPreferences.getInstance();
                    await pref.setBool(LOGIN_KEY, true);
                    await pref.setString(USER_NAME, userName);

                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homescreen(),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter Email and Password')),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.green, Colors.teal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ]
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
