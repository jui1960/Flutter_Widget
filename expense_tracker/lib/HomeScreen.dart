import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
