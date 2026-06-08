import 'package:flutter/material.dart';

class Flowerdetails extends StatefulWidget {
  const Flowerdetails({super.key});

  @override
  State<Flowerdetails> createState() => _FlowerdetailsState();
}

class _FlowerdetailsState extends State<Flowerdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Hero(
          tag: 'flower',
          child: Image(
            image: AssetImage('assets/images/flower.webp'),
            height: 900,
            width: 600,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
