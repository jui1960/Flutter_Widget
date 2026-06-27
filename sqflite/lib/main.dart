import 'package:flutter/material.dart';
import 'package:sqflite_demogit/SplashScreen.dart';
import 'homePage.dart';

void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );

  }

}